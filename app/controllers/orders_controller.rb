class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :accept, :confirm, :cancel]
  before_action :authorize_client, only: [:new, :create]

  def index
    set_orders()
  end

  def show
    set_orders()
  end

  def new
    @order = Order.new
    set_buffet_and_event()
    @order.venue = @event.address
    @order.event_day = Date.today
  end

  def create
    @order = Order.new(order_params)
    @order.buffet = Buffet.find(params[:order][:buffet_id])
    @order.event = Event.find(params[:order][:event_id])
    @order.client = current_client

    # Atualize o total do pedido com base nos dados do evento
    if @order.amount_people
      @order.total_value = @order.event.base_price + (@order.extra_hour * @order.event.value_extra_hour) + (@order.amount_people - @order.event.min_people) * @order.event.additional_per_person
    end

    if @order.save
      redirect_to @order, notice: 'Pedido cadastrado com sucesso!'
    else
      # Repopular os dados do buffet e do evento
      set_buffet_and_event()
      flash.now[:notice] = 'Pedido não cadastrado'
      render 'new'
    end
  end


  def accept
    # @order.total_value = @order.event.base_price + (@order.amount_people - @order.event.min_people) * @order.event.additional_per_person
    if @order.update(order_params_accept)
      calcula_valor_pedido_aceito
      redirect_to @order, notice: 'Pedido aceito com sucesso.'
    else
      redirect_to @order
    end
  end

  def confirm
    @order.update(status: 'Pedido confirmado pelo cliente')
    redirect_to @order, notice: 'Pedido confirmado com sucesso.'
  end

  def cancel
    @order.update(status: 'Pedido cancelado')
    redirect_to @order, notice: 'Pedido cancelado com sucesso.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def authorize_client
    unless client_signed_in?
      redirect_to new_client_session_path, alert: "Faça o cadastro ou login para realizar pedidos."
    end
  end

  def set_buffet_and_event
    if params[:order]
      @buffet = Buffet.find(params[:order][:buffet_id])
      @event = Event.find(params[:order][:event_id])
    else
      @buffet = Buffet.find(params[:buffet_id])
      @event = Event.find(params[:event_id])
    end
  end

  def set_orders
    if client_signed_in?
      @orders = Order.where(client_id: current_client.id)
    elsif buffet_profile_signed_in?
      @orders = Order.where(buffet_id: current_buffet_profile.buffet)
    else
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order).permit(:event_day, :amount_people, :details, :venue, :total_value, :extra_hour, :payment)
  end

  def order_params_accept
    params.require(:order).permit(:discount, :discount_description, :surcharge, :surcharge_description,  :order_vality, :status, :total_value)
  end

  def calcula_valor_pedido_aceito
    @order.total_value = @order.total_value + @order.surcharge - @order.discount
    @order.save
  end

end

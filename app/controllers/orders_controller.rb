class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :accept, :confirm]
  before_action :authorize_client, only: [:new, :create]
  before_action :set_buffet_and_event, only: [:new]

  def index
    if client_signed_in?
      @orders = Order.where(client_id: current_client.id)
    elsif buffet_profile_signed_in?
      @orders = Order.where(buffet_id: current_buffet_profile.buffet)
    else
      redirect_to root_path
    end
  end

  def show
    if client_signed_in?
      @orders = Order.where(client_id: current_client.id)
    elsif buffet_profile_signed_in?
      @orders = Order.where(buffet_id: current_buffet_profile.buffet)
    else
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.buffet = Buffet.find(params[:order][:buffet_id])
    @order.event = Event.find(params[:order][:event_id])
    @order.client = current_client
    # @order.total_value = @order.event.base_price
    @order.total_value = @order.event.base_price + (@order.amount_people - @order.event.min_people) * @order.event.additional_per_person

    if @order.save
      redirect_to @order, notice: 'Pedido cadastrado com sucesso!'
    else
      return render('new'), notice: 'Pedido não cadastrado.'
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

  def order_params
    params.require(:order).permit(:event_day, :amount_people, :details, :venue, :total_value)
  end

  def order_params_accept
    params.require(:order).permit(:discount, :discount_description, :surcharge, :surcharge_description,  :order_vality, :status, :total_value)
  end

  def calcula_valor_pedido_aceito
    @order.total_value = @order.total_value + @order.surcharge - @order.discount
    @order.save
  end

end

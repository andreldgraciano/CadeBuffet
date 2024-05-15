class OrdersController < ApplicationController
  before_action :authenticate_buffet_profile_or_client!, only: [:index, :show, :accept, :confirm, :cancel]
  before_action :authenticate_client!, only: [:new, :create]

  before_action :set_order, only: [:show, :accept, :confirm, :cancel]

  before_action :authorization_access_order!, only: [:show, :accept, :confirm, :cancel]

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
      set_buffet_and_event()
      flash.now[:notice] = 'Pedido não cadastrado'
      render 'new'
    end
  end

  def accept
    if @order.update(order_params_accept)
      calc_value_order_accepted
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

  def authenticate_client!
    redirect_to root_path, notice: "Você precisa estar autenticado como client para criar um pedido" unless client_signed_in?
  end

  def authenticate_buffet_profile_or_client!
    redirect_to root_path, notice: "Você precisa estar autenticado como client ou buffet_profile para acessar um pedido" unless buffet_profile_signed_in? || client_signed_in?
  end

  def set_order
    @order = Order.find(params[:id])
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

  def calc_value_order_accepted
    @order.total_value = @order.total_value + @order.surcharge - @order.discount
    @order.save
  end

  def authorization_access_order!
    if buffet_profile_signed_in? && current_buffet_profile.buffet.id != @order.buffet.id
      flash[:notice] = 'Você não tem permissão para acessar pedidos de outros biffets'
      redirect_to home_buffet_profile_path
    elsif client_signed_in? && current_client.id != @order.client.id
      flash[:notice] = 'Você não tem permissão para acessar pedidos de outros clientes'
      redirect_to root_path
    end
  end

end

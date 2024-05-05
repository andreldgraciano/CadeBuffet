class OrdersController < ApplicationController
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
    @order = Order.find(params[:id])
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

    if @order.save
      flash[:notice] = 'Pedido cadastrado com sucesso!'
      redirect_to @order
    else
      flash.now[:notice] = 'Pedido não cadastrado.'
      return render('new')
    end
  end

  def confirm
    @order = Order.find(params[:id])
    if buffet_profile_signed_in?
      @order.update(status: 'Pedido aceito pelo buffet')
      redirect_to @order, notice: 'Pedido aceito com sucesso.'
    elsif client_signed_in?
      @order.update(status: 'Pedido confirmado pelo cliente')
      redirect_to @order, notice: 'Pedido confirmado com sucesso.'
    end
  end

  private

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
    params.require(:order).permit(:event_day, :amount_people, :details, :venue)
  end
end

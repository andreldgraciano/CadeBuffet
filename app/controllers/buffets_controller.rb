class BuffetsController < ApplicationController
  before_action :set_buffet, only: [:show, :edit, :update]

  before_action :set_buffet_profile, only: [:show, :edit, :update]
  before_action :authorize_buffet_access, only: [:show, :edit, :update]
  before_action :authorize_buffet_new_create, only: [:new, :create]

  def index
    @buffets = Buffet.all
  end

  def show; end

  def new
    @buffet = Buffet.new
    @payments = Payment.all
  end

  def create
    @buffet = Buffet.new(buffet_params())
    @buffet.buffet_profile = current_buffet_profile

    if @buffet.save
      flash[:notice] = 'Buffet cadastrado com sucesso!'
      redirect_to(@buffet)
    else
      @payments = Payment.all
      flash.now[:notice] = 'Buffet não cadastrado.'
      return render('new')
    end
  end

  def edit
    @payments = Payment.all
  end

  def update
    if @buffet.update(buffet_params())
      flash[:notice] = 'Buffet atualizado com sucesso!'
      redirect_to(@buffet)
    else
      @payments = Payment.all
      flash.now[:notice] = 'Buffet não pôde ser atualizado.'
      render('edit')
    end
  end

  private

  def set_buffet()
    @buffet = Buffet.find(params[:id])
  end

  def set_buffet_profile
    # @buffet_profile = BuffetProfile.find(params[:id])
    @buffet_profile = BuffetProfile.find(@buffet.buffet_profile_id)
  end

  def buffet_params
    params.require(:buffet).permit(:brand_name, :corporate_name, :registration_number, :phone, :email, :address, :district, :state, :city, :zip_code, :description, :payment_id)
  end

  def authorize_buffet_new_create
    if buffet_profile_signed_in?
        redirect_to root_path, alert: 'Você já cadastrou o seu biffet!' unless !Buffet.exists?(buffet_profile_id: current_buffet_profile.id)
    else
      redirect_to buffets_path, alert: 'Você não tem permissão para cadastrar um biffet!'
    end
  end

  def authorize_buffet_access
    redirect_to root_path, alert: 'Você não tem acesso a esse biffet!' unless @buffet_profile == current_buffet_profile
  end

end

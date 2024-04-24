class BuffetsController < ApplicationController
  before_action(:set_buffet, only: [:show, :edit, :update])
  before_action(:authenticate_buffet_profile!, only: [:show, :new, :create, :edit, :update])

  # if buffet_profile_signed_in?
  #   @buffet_profile = current_buffet_profile
  #   if Buffet.exists?(buffet_profile_id: @buffet_profile.id)
  #     before_action(:authenticate_buffet_profile!, only: [:show, :edit, :update])
  #   else
  #     before_action(:authenticate_buffet_profile!, only: [:new, :create])
  #     redirect_to new_buffet_path
  #   end
  # else client_signed_in?
  #   before_action(:authenticate_client!, only: [:index])
  # end

  def index
    @buffets = Buffet.all
  end

  def show

  end

  def new
    already_buffet()
    @buffet = Buffet.new
    @payments = Payment.all
  end

  def create
    already_buffet()
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
      return render('edit')
    end
  end

  private

  def set_buffet()
    @buffet = Buffet.find(params[:id])
  end

  def buffet_params
    params.require(:buffet).permit(:brand_name, :corporate_name, :registration_number, :phone, :email, :address, :district, :state, :city, :zip_code, :description, :payment_id)
  end

  def already_buffet
    if buffet_profile_signed_in?
      @buffet_profile = current_buffet_profile
      if Buffet.exists?(buffet_profile_id: @buffet_profile.id)
        buffet = Buffet.find_by(buffet_profile_id: @buffet_profile.id)
        flash[:notice] = 'Você já cadastrou o seu biffet!'
        redirect_to buffet_path(buffet)
      end
    else
      flash[:notice] = 'Você não tem permissão para cadastrar um biffet!'
      redirect_to buffets_path
    end
  end

end

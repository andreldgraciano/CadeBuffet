class BuffetsController < ApplicationController
  before_action :set_buffet, only: [:show, :edit, :update]
  before_action :set_buffet_profile, only: [:edit, :update]
  before_action :set_buffet_profile_buffet_event, only: [:edit, :update]

  before_action :authorize_buffet_edit_update, only: [:edit, :update]
  before_action :authorize_buffet_new_create, only: [:new, :create]
  before_action :authorize_buffet_show, only: [:show]

  def show

  end

  def new
    @buffet = Buffet.new
  end

  def create
    @buffet = Buffet.new(buffet_params)
    @buffet.buffet_profile = current_buffet_profile

    if @buffet.save
      flash[:notice] = 'Buffet cadastrado com sucesso!'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Buffet não cadastrado.'
      return render('new')
    end
  end

  def edit
  end

  def update
    if @buffet.update(buffet_params)
      flash[:notice] = 'Buffet atualizado com sucesso!'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Buffet não pôde ser atualizado.'
      render('edit')
    end
  end

  private

  def set_buffet_profile
    @buffet_profile = BuffetProfile.find(@buffet.buffet_profile_id)
  end

  def set_buffet
    @buffet = Buffet.find(params[:id])
  end

  def set_buffet_profile_buffet_event
    @events = @buffet_profile.buffet.events
  end

  def buffet_params
    params.require(:buffet).permit(:brand_name, :corporate_name, :registration_number, :phone, :email, :address, :district, :state, :city, :zip_code, :description, :payment)
  end

  def authorize_buffet_show
    redirect_to home_buffet_profile_path, alert: 'Você só pode acessar o seu buffet!' unless !current_buffet_profile
  end

  def authorize_buffet_new_create
    redirect_to home_buffet_profile_path, alert: 'Você já cadastrou o seu biffet!' unless !Buffet.exists?(buffet_profile_id: current_buffet_profile.id)
  end

  def authorize_buffet_edit_update
    redirect_to home_buffet_profile_path, alert: 'Você não tem acesso a esse biffet!' unless @buffet_profile == current_buffet_profile
  end
end

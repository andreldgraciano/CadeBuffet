class HomeController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:buffet_profile]
  before_action :authenticate_client!, only: [:client]

  def index
    if buffet_profile_signed_in?
      redirect_to_buffet_or_create
    elsif client_signed_in?
      redirect_to(buffets_path)
    end
  end

  def buffet_profile; end

  def client; end

  private

  def redirect_to_buffet_or_create
    @buffet_profile = current_buffet_profile
    buffet = Buffet.find_by(buffet_profile_id: @buffet_profile.id)

    if buffet
      redirect_to buffet_path(buffet)
    else
      flash[:notice] = 'Cadastre seu buffet!'
      redirect_to new_buffet_path
    end
  end
end

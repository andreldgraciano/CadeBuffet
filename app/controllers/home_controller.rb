class HomeController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:buffet_profile]
  before_action :authenticate_client!, only: [:client]#, unless: :buffet_profile_signed_in?

  def index
    if buffet_profile_signed_in?
      @buffet_profile = current_buffet_profile
      if Buffet.exists?(buffet_profile_id: @buffet_profile.id)
        buffet = Buffet.find_by(buffet_profile_id: @buffet_profile.id)
        redirect_to buffet_path(buffet)
      else
        flash[:notice] = 'Cadastre seu biffet!'
        redirect_to new_buffet_path
      end
    else client_signed_in?
      redirect_to(buffets_path)
    end
  end

  def buffet_profile

  end

  def client
  end

  private

end

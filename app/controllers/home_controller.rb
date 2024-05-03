class HomeController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:buffet_profile]

  def index
    redirect_to buffets_path
  end

  def buffet_profile
    redirect_to_root_or_create
  end

  private

  def redirect_to_root_or_create
    @buffet = Buffet.find_by(buffet_profile_id: current_buffet_profile)

    if !@buffet
      flash[:notice] = 'Cadastre seu buffet!'
      redirect_to new_buffet_path
    end
  end
end

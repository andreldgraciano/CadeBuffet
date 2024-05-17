class HomeController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:buffet_profile]

  def index
    if buffet_profile_signed_in?
      return redirect_to home_buffet_profile_path
    end
    redirect_to buffets_path
  end

  def buffet_profile
    @buffet = Buffet.find_by(buffet_profile_id: current_buffet_profile)

    if !@buffet
      flash[:notice] = 'Register your buffet'
      redirect_to new_buffet_path
    end
  end
end

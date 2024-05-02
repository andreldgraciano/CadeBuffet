class HomeController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:buffet_profile]

  def index
    if buffet_profile_signed_in?
      if params[:query]
        flash[:notice] = 'Funcionalidade de pesquisa não autorizada para donos de buffet.'
      end
      redirect_to home_buffet_profile_path
    else
      if params[:query]
        query = params[:query]
        @buffets = Buffet.joins(:events).where("brand_name LIKE ? OR city LIKE ? OR events.name LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%").distinct.order(:brand_name)
      else
        @buffets = Buffet.all.sort_by { |buffet| buffet.brand_name }
      end
    end
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

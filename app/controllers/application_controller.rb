class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters_client, if: :client_devise_controller?
  layout :set_layout

  private

  def configure_permitted_parameters_client
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf])
  end

  def client_devise_controller?
    params[:controller].start_with?('clients/') && devise_controller?
  end

  def set_layout
    if buffet_profile_signed_in?
      "buffet_profile"
    elsif client_signed_in?
      "client"
    else
      "application"
    end
  end
end

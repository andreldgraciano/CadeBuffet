class ApplicationController < ActionController::Base
  layout :set_layout

  private

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

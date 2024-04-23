class HomeController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:buffet_profile]
  before_action :authenticate_client!, only: [:client]#, unless: :buffet_profile_signed_in?

  def index
  end

  def buffet_profile
  end

  def client
  end
end

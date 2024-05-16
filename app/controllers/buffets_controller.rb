class BuffetsController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:new, :create, :edit, :update]

  before_action :set_buffet, only: [:show, :edit, :update]
  before_action :set_buffet_profile, only: [:edit, :update]
  before_action :set_buffet_profile_buffet_event, only: [:edit, :update]

  before_action :authorize_buffet_edit_update, only: [:edit, :update]
  before_action :authorize_buffet_new_create, only: [:new, :create]
  before_action :authorize_buffet_show, only: [:show]



  def index
    if buffet_profile_signed_in?
      if params[:query]
        flash[:notice] = 'Unauthorized search functionality for buffet owners'
      end
      flash[:notice] = 'You can only access your buffet'
      redirect_to home_buffet_profile_path
    else
      if params[:query]
        query = params[:query]
        # puts "Buffet.all: #{Buffet.all.inspect}"
        # puts "query: #{query}"
        # @buffets = Buffet.joins(:events).where("brand_name LIKE ? OR city LIKE ? OR events.name LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%").distinct.order(:brand_name)
        @buffets = Buffet.where("brand_name LIKE ? OR city LIKE ?", "%#{query}%", "%#{query}%").distinct.order(:brand_name)
        @buffets = Buffet.left_joins(:events).where("buffets.brand_name LIKE ? OR buffets.city LIKE ? OR events.name LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%").distinct.order(:brand_name)
        # puts "@buffets.inspect: #{@buffets.inspect}"
      else
        @buffets = Buffet.all.sort_by { |buffet| buffet.brand_name }
      end
    end
  end

  def show

  end

  def new
    @buffet = Buffet.new
  end

  def create
    if Buffet.exists?(buffet_profile_id: current_buffet_profile.id)
      return redirect_to home_buffet_profile_path, alert: 'You have already registered your buffet'
    end

    @buffet = Buffet.new(buffet_params)
    @buffet.buffet_profile = current_buffet_profile



    if @buffet.save
      flash[:notice] = 'Buffet registered successfully'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Buffet not registered'
      return render('new')
    end
  end

  def edit
  end

  def update
    if @buffet.update(buffet_params)
      flash[:notice] = 'Successfully updated buffet'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Buffet could not be updated'
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
    redirect_to home_buffet_profile_path, alert: 'You can only access your buffet' unless !current_buffet_profile
  end

  def authorize_buffet_new_create
    redirect_to home_buffet_profile_path, alert: 'You have already registered your buffet' unless !Buffet.exists?(buffet_profile_id: current_buffet_profile.id)
  end

  def authorize_buffet_edit_update
    redirect_to home_buffet_profile_path, alert: 'You do not have access to modify this buffet' unless @buffet_profile == current_buffet_profile
  end
end

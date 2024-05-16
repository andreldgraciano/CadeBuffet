class EventsController < ApplicationController
  before_action :authenticate_buffet_profile!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_buffet, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:edit, :update, :destroy]

  before_action :authorize_buffet_profile_edit_update_destroy_own_event, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.buffet_id = @buffet.id

    if @event.save
      flash[:notice] = 'Event registered successfully'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Event not registered'
      return render('new')
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      flash[:notice] = 'Event updated successfully'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Event could not be updated'
      render('edit')
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = 'Event removed successfully'
    redirect_to(home_buffet_profile_path)
  end

  private

  def set_event
    if @event = current_buffet_profile.buffet.events.find_by(id: params[:id])
      return @event = current_buffet_profile.buffet.events.find_by(id: params[:id])
    end
  end

  def set_buffet
    @buffet = current_buffet_profile.buffet
  end

  def event_params
    params.require(:event).permit(:name, :description, :min_people, :max_people, :duration, :base_price, :additional_per_person, :value_extra_hour, :base_price_weekend, :additional_per_person_weekend, :value_extra_hour_weekend, :menu, :address, :venue_preference, :alcoholic_drink, :decoration, :parking)
  end

  def authorize_buffet_profile_edit_update_destroy_own_event
    unless current_buffet_profile.buffet.events.include?(@event)
      flash[:alert] = "You are not allowed to manipulate other buffets' events"
      redirect_to home_buffet_profile_path
    end
  end
end

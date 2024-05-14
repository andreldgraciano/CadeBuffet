class EventsController < ApplicationController
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
      flash[:notice] = 'Evento cadastrado com sucesso!'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Evento não cadastrado.'
      return render('new')
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      flash[:notice] = 'evento atualizado com sucesso!'
      redirect_to(home_buffet_profile_path)
    else
      flash.now[:notice] = 'Evento não pôde ser atualizado.'
      render('edit')
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = 'Evento removido com sucesso!'
    redirect_to(home_buffet_profile_path)
  end

  private

  def set_event
    @event = current_buffet_profile.buffet.events.find(params[:id])
  end

  def set_buffet
    @buffet = current_buffet_profile.buffet
  end

  def event_params
    params.require(:event).permit(:name, :description, :min_people, :max_people, :duration, :base_price, :additional_per_person, :value_extra_hour, :base_price_weekend, :additional_per_person_weekend, :value_extra_hour_weekend, :menu, :address, :venue_preference, :alcoholic_drink, :decoration, :parking)
  end

  def authorize_buffet_profile_edit_update_destroy_own_event
    unless @event.buffet_id == @buffet.id
      flash[:alert] = "Você não tem permissão para excluir este evento."
      redirect_to home_buffet_profile_path
    end
  end
end

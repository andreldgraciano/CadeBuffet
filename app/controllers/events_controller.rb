class EventsController < ApplicationController
  before_action :set_buffet, only: [:new, :create, :edit, :update]
  # before_action :set_event, only: [:new, :create, :edit, :update]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.buffet_id = @buffet.id

    if @event.save
      flash[:notice] = 'Evento cadastrado com sucesso!'
      redirect_to(@buffet)
    else
      flash.now[:notice] = 'Evento não cadastrado.'
      return render('new')
    end
  end

  def edit
    #so pode editar se o buffet_profile for o mesmo do referenciado pelo buffet do evento.
  end

  def update
    if @event.update(event_params)
      flash[:notice] = 'evento atualizado com sucesso!'
      redirect_to(@buffet)
    else
      flash.now[:notice] = 'evento não pôde ser atualizado.'
      render('edit')
    end
  end

  private

  def set_event
    #fix that
    #@event = current_buffet_profile.buffet.events.find(params[:id])
  end

  def set_buffet
    @buffet = current_buffet_profile.buffet
  end

  def event_params
    params.require(:event).permit(:name, :description, :min_people, :max_peaple, :duration, :menu, :address, :alcoholic_drink, :decoration, :parking)
  end
end

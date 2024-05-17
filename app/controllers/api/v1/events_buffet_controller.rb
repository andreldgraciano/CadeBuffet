class Api::V1::EventsBuffetController < Api::V1::ApiController
  def show
    buffet = Buffet.find(params[:id])
    events = buffet.events
    render status: 200, json: events.as_json(except: [:created_at, :updated_at, :buffet_id])
  end

  private

  def return_404
    render status: 404
  end

  def return_500
    render status: 500
  end
end

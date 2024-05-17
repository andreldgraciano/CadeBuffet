class Api::V1::EventsController < Api::V1::ApiController
  def show
    event = Event.find(params[:id])
    buffet = event.buffet
    orders = buffet.orders

    param_date = params[:date]
    param_amount_people = params[:amount_people].to_i

    year, month, day = param_date.split('-').map(&:to_i)
    date = Date.new(year, month, day)

    order = Order.where(event_day: date).where.not(status: 'Waiting for buffet review')

    if param_date && date <= Date.today
      resposta = {status: "Unavailable for today or old dates"}
      render status: 200, json: resposta.as_json
    else
      if param_date && param_amount_people
        if order.exists?
          resposta = {status: "Unavailable for date #{date}"}
          render status: 200, json: resposta.as_json
        else
          if param_amount_people >= event.min_people && param_amount_people <= event.max_people
            if date.on_weekend?
              total_value = event.base_price_weekend + (param_amount_people - event.min_people) * event.additional_per_person_weekend
            else
              total_value = event.base_price + (param_amount_people - event.min_people) * event.additional_per_person
            end
            resposta = { status: 'Available', event_name: event.name, date: param_date, amount_people: param_amount_people, total_value: total_value }
            render status: 200, json: resposta.as_json
          else
            resposta = {status: 'Event unavailable for this number of people', min_people: event.min_people, max_people: event.max_people}
            render status: 200, json: resposta.as_json
          end
        end
      else
        resposta = {status: 'Insufficient data'}
        render status: 200, json: resposta.as_json
      end
    end

  end

  private

  def return_404
    render status: 404
  end

  def return_500
    render status: 500
  end
end

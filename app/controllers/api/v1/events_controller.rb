class Api::V1::EventsController < Api::V1::ApiController
  # http://localhost:3000/api/v1/events/1?date=27/10/2024&amount_people=100
  def show
    event = Event.find(params[:id])
    buffet = event.buffet
    orders = buffet.orders

    param_date = params[:date]
    param_amount_people = params[:amount_people].to_i

    day, month, year = param_date.split('/').map(&:to_i)
    date = Date.new(year, month, day)

    order = Order.where(event_day: date).where.not(status: 'Waiting for buffet review')

    if param_date && param_amount_people
      if order.exists?
        resposta = {resposta: "Indisponível para data #{date}"}
        render status: 200, json: resposta.as_json
      else
        if param_amount_people >= event.min_people && param_amount_people <= event.max_people
          resposta = { status: 'Disponível', nome: event.name, date: param_date, amount_people: param_amount_people, total_value: 200 }
          render status: 200, json: resposta.as_json
        else
          resposta = {resposta: 'Evento indisponível para esta quantidade de pessoas', min_people: event.min_people, max_people: event.max_people}
          render status: 200, json: resposta.as_json
        end
      end
    else
      resposta = {resposta: 'Dados insuficientes'}
      render status: 200, json: resposta.as_json
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

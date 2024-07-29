require 'rails_helper'

describe 'Buffet API' do

  context 'GET /api/v1/events/id?date=XXXX&amount_people=XXXX' do

    it 'com sucesso' do

      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet_1 = Buffet.create!(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )
      event_1 = Event.create!(
        name: 'Festa de Casamento Villa',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: 1,
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )
      date = Date.tomorrow

      get("/api/v1/events/1?date=#{date.year}-#{date.month}-#{date.day}&amount_people=#{(event_1.min_people + event_1.max_people)/2}")

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('Available')
      expect(json_response['event_name']).to eq('Festa de Casamento Villa')
      expect(json_response['amount_people']).to eq((event_1.min_people + event_1.max_people)/2)
      expect(json_response['total_value']).to eq(37500)
    end

    it 'e falha se não encontrar o evento' do
      # Arrange

      get("/api/v1/events/1?date=2035-11-05&amount_people=80")

      expect(response.status).to eq(404)
    end

    it 'e falha se informar a url correta' do
      # Arrange

      get("/api/v1/events/1?date=20-11-05&aunt_people=80")

      expect(response.status).to eq(404)
    end

    it 'falha se fizer pedido para o mesmo dia de outro pedido' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.create!(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )
      event = Event.create!(
        name: 'Festa de Casamento Villa',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: buffet.id,
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )
      client = Client.create!(
        email: 'andre@gmail.com',
        name: 'André Dias',
        cpf: 65971070045,
        password: 'andre123@'
      )
      date = Date.tomorrow
      order = Order.create!(
        buffet_id: buffet.id,
        event_id: event.id,
        client_id: client.id,
        event_day: "#{date.year}-#{date.month}-#{date.day}",
        amount_people: 160,
        details: 'Detalhes do pedido',
      )
      order.update!(status: 'Order accepted by buffet')

      get("/api/v1/events/1?date=#{date.year}-#{date.month}-#{date.day}&amount_people=#{order.amount_people}")

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq("Unavailable for date #{date}")
    end

    it 'falha se fizer pedido para uma quantidade maior que a maxima ou menor que a minima de convidados' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.create!(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )
      event = Event.create!(
        name: 'Festa de Casamento Villa',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: buffet.id,
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )
      client = Client.create!(
        email: 'andre@gmail.com',
        name: 'André Dias',
        cpf: 65971070045,
        password: 'andre123@'
      )
      date = Date.tomorrow
      order = Order.create!(
        buffet_id: buffet.id,
        event_id: event.id,
        client_id: client.id,
        event_day: "#{date.year}-#{date.month}-#{date.day}",
        amount_people: 160,
        details: 'Detalhes do pedido',
      )
      date = Date.tomorrow + 1
      order.update!(status: 'Order accepted by buffet')

      get("/api/v1/events/1?date=#{date.year}-#{date.month}-#{date.day}&amount_people=100")

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq("Event unavailable for this number of people")
      expect(json_response['min_people']).to eq(event.min_people)
      expect(json_response['max_people']).to eq(event.max_people)
    end
  end
end

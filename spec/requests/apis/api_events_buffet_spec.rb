require 'rails_helper'

describe 'Buffet API' do

  context 'GET /api/v1/events_buffet/id' do

    it 'e retorna a coleçao de eventos de um buffet' do
      
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )
      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@',
      )
      buffet_1 = Buffet.create!(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 546546465,
        phone: 32998941245,
        email: 'sac@buffetreal.com',
        address: 'Rua Florianopolis, 123',
        district: 'Centro',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35322124,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile_1.id,
        payment: 1,
      )
      buffet_2 = Buffet.create!(
        brand_name: 'Buffet Elegance',
        corporate_name: 'Elegances Buffet LTDA',
        registration_number: 41312312,
        phone: 33998948372,
        email: 'sac@elegancebuffet.com',
        address: 'Avenida da luz, 435',
        district: 'Fabricas',
        state: 'SP',
        city: 'São Paulo',
        zip_code: 7454562514,
        description: 'Um show de elegancia para o seu buffet',
        buffet_profile_id: buffet_profile_2.id,
        payment: 0,
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
        buffet_id: buffet_1.id,
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )
      event_2 = Event.create!(
        name: 'Aniversário',
        description: 'Celebre um aniversário em grande estilo!',
        min_people: 50,
        max_people: 100,
        duration: 180,
        menu: 'Salgadinhos, Bolo, Refrigerante, Docinhos',
        address: 'Avenida das Flores, 123, Centro, SP - São Paulo',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: buffet_2.id,
        venue_preference: 'no_preference',
        base_price: 8000,
        additional_per_person: 200,
        value_extra_hour: 1500,
        base_price_weekend: 12000,
        additional_per_person_weekend: 300,
        value_extra_hour_weekend: 2000
      )
      event_3 = Event.create!(
        name: 'Festa de Formatura',
        description: 'Celebre a conquista com uma festa inesquecível!',
        min_people: 80,
        max_people: 150,
        duration: 240,
        menu: 'Coquetel, Buffet de Massas, Bebidas Variadas',
        address: 'Rua dos Estudantes, 456, Universitário, RJ - Rio de Janeiro',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: buffet_2.id,
        venue_preference: 'no_preference',
        base_price: 12000,
        additional_per_person: 300,
        value_extra_hour: 2000,
        base_price_weekend: 18000,
        additional_per_person_weekend: 450,
        value_extra_hour_weekend: 3000
      )
      event_4 = Event.create!(
        name: 'Festa de Natal da Empresa',
        description: 'Celebre o espírito natalino com seus colegas!',
        min_people: 30,
        max_people: 80,
        duration: 180,
        menu: 'Jantar, Vinho, Sobremesas',
        address: 'Av. dos Trabalhadores, 789, Industrial, PR - Curitiba',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: buffet_1.id,
        venue_preference: 'no_preference',
        base_price: 6000,
        additional_per_person: 150,
        value_extra_hour: 1000,
        base_price_weekend: 9000,
        additional_per_person_weekend: 225,
        value_extra_hour_weekend: 1500
      )

      get("/api/v1/events_buffet/#{buffet_2.id}")

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['name']).to eq('Aniversário')
      expect(json_response[1]['name']).to eq('Festa de Formatura')
    end

    it 'e retorna vazio se não houver eventos' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )
      buffet = Buffet.create!(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 546546465,
        phone: 32998941245,
        email: 'sac@buffetreal.com',
        address: 'Rua Florianopolis, 123',
        district: 'Centro',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35322124,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1,
      )

      get("/api/v1/events_buffet/#{buffet.id}")

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(0)
      expect(json_response).to eq([])

    end

    it 'e falha se houver um erro do servidor' do
      allow(Buffet).to receive(:find).and_raise(ActiveRecord::QueryCanceled)

      get('/api/v1/events_buffet/999999')

      expect(response).to have_http_status(500)
    end

    it 'e falha se não encontrar o buffet' do
      # Arrange

      get( '/api/v1/events_buffet/999999999')

      expect(response.status).to eq(404)
    end
  end
end

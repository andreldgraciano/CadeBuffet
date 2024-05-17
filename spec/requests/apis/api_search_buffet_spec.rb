require 'rails_helper'

describe 'Buffet API' do

  context 'GET /api/v1/search_buffet/' do

    it 'e encontra buffets coincidentes com a busca' do
      
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )
      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@',
      )
      buffet_profile_3 = BuffetProfile.create!(
        email: 'villaspalace@gmail.com',
        password: 'villaspalace123@'
      )
      Buffet.create!(
        brand_name: 'Buffet Real Palace',
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
      Buffet.create!(
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
      buffet_3 = Buffet.create!(
        brand_name: 'Buffet Villas Palace',
        corporate_name: 'Buffet Villas Palace LTDA',
        registration_number: 13279305000126,
        phone: 2826376443,
        email: 'sac@villaspalace.com',
        address: 'Travessa São Bartolomeu, 35',
        district: 'do Quadro',
        state: 'ES',
        city: 'Vitória',
        zip_code: 7454562514,
        description: 'Um show de elegancia para o seu buffet',
        buffet_profile_id: buffet_profile_3.id,
        payment: 0
      )

      get('/api/v1/search_buffet/palace')

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['brand_name']).to eq('Buffet Real Palace')
      expect(json_response[1]['brand_name']).to eq('Buffet Villas Palace')
    end

    it 'e retorna vazio se não houver buffets coincidentes com a busca' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )
      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@',
      )
      Buffet.create!(
        brand_name: 'Buffet Real Palace',
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
      Buffet.create!(
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

      get('/api/v1/search_buffet/villas')

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response).to eq([])
      expect(json_response.length).to eq(0)
    end

    it 'e falha se houver um erro do servidor' do
      allow(Buffet).to receive(:where).and_raise(ActiveRecord::QueryCanceled)

      get('/api/v1/search_buffet/palace')

      expect(response).to have_http_status(500)
    end
  end
end

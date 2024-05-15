require 'rails_helper'

describe 'Buffet API' do

  context 'GET /api/v1/buffets/id' do

    it 'com sucesso' do

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

      get("/api/v1/buffets/#{buffet.id}")

      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['brand_name']).to eq('Buffet Real')
      expect(json_response['description']).to eq('Um buffet completo para o seu evento')
      expect(json_response.keys).not_to include('created_at')
      expect(json_response.keys).not_to include('updated_at')
    end

    it 'e falha se não encontrar o buffet' do
      # Arrange

      get( '/api/v1/buffets/999999999')

      expect(response.status).to eq(404)
    end
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

client_1 = Client.create!(
  email: 'andre@gmail.com',
  name: 'André Dias',
  cpf: 65971070045,
  password: 'andre123@',
)

client_2 = Client.create!(
  email: 'ataliba@gmail.com',
  name: 'Ataliba Couto',
  cpf: 92211219098,
  password: 'ataliba123@',
)

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
  password: 'villaspalace123@',
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
  payment: 1,
)

buffet_2 = Buffet.create!(
  brand_name: 'Buffet Elegance',
  corporate_name: 'Elegances Buffet LTDA',
  registration_number: 72279600000141,
  phone: 1426272593,
  email: 'sac@elegancebuffet.com',
  address: 'Rua Francesco Tessarin, 435',
  district: 'Recanto Verde do Sol',
  state: 'SP',
  city: 'São Paulo',
  zip_code: 18382240,
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
  payment: 0,
)

event_3 = Event.create!(
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

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
  password: 'andre123@'
)

client_2 = Client.create!(
  email: 'ataliba@gmail.com',
  name: 'Ataliba Couto',
  cpf: 92211219098,
  password: 'ataliba123@'
)

buffet_profile_1 = BuffetProfile.create!(
  email: 'real@gmail.com',
  password: 'real123@'
)

buffet_profile_2 = BuffetProfile.create!(
  email: 'elegance@gmail.com',
  password: 'elegance123@'
)

buffet_profile_3 = BuffetProfile.create!(
  email: 'villaspalace@gmail.com',
  password: 'villaspalace123@'
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
  payment: 0
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
  buffet_id: 2,
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
  buffet_id: 3,
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
  buffet_id: 1,
  venue_preference: 'no_preference',
  base_price: 6000,
  additional_per_person: 150,
  value_extra_hour: 1000,
  base_price_weekend: 9000,
  additional_per_person_weekend: 225,
  value_extra_hour_weekend: 1500
)

event_5 = Event.create!(
  name: 'Chá de Bebê',
  description: 'Celebre a chegada do bebê com amigos e familiares!',
  min_people: 20,
  max_people: 50,
  duration: 120,
  menu: 'Bolo, Docinhos, Salgadinhos, Refrigerante',
  address: 'Rua das Mamães, 321, Maternidade, MG - Belo Horizonte',
  alcoholic_drink: 'no_alcohol',
  decoration: 'yes_decoration',
  parking: 'no_parking',
  buffet_id: 2,
  venue_preference: 'no_preference',
  base_price: 3000,
  additional_per_person: 100,
  value_extra_hour: 750,
  base_price_weekend: 4500,
  additional_per_person_weekend: 150,
  value_extra_hour_weekend: 1000
)

event_6 = Event.create!(
  name: 'Festa de Noivado',
  description: 'Celebre o noivado em grande estilo!',
  min_people: 40,
  max_people: 80,
  duration: 180,
  menu: 'Coquetel, Buffet de Finger Foods, Bebidas Variadas',
  address: 'Av. dos Namorados, 555, Romântico, SP - Campinas',
  alcoholic_drink: 'yes_alcohol',
  decoration: 'yes_decoration',
  parking: 'yes_parking',
  buffet_id: 3,
  venue_preference: 'no_preference',
  base_price: 7000,
  additional_per_person: 175,
  value_extra_hour: 1250,
  base_price_weekend: 10500,
  additional_per_person_weekend: 263,
  value_extra_hour_weekend: 1750
)

event_7 = Event.create!(
  name: 'Festa de Halloween',
  description: 'Uma noite de sustos e diversão!',
  min_people: 60,
  max_people: 120,
  duration: 240,
  menu: 'Petiscos Temáticos, Cocktails Especiais',
  address: 'Rua do Medo, 13, Assombrada, RJ - Niterói',
  alcoholic_drink: 'yes_alcohol',
  decoration: 'yes_decoration',
  parking: 'yes_parking',
  buffet_id: 1,
  venue_preference: 'no_preference',
  base_price: 9000,
  additional_per_person: 225,
  value_extra_hour: 1500,
  base_price_weekend: 13500,
  additional_per_person_weekend: 338,
  value_extra_hour_weekend: 2250
)

event_8 = Event.create!(
  name: 'Festa de Reveillon',
  description: 'Receba o novo ano com uma festa espetacular!',
  min_people: 100,
  max_people: 200,
  duration: 300,
  menu: 'Jantar de Gala, Champanhe, Buffet de Sobremesas',
  address: 'Praia do Ano Novo, S/N, Litoral, BA - Salvador',
  alcoholic_drink: 'yes_alcohol',
  decoration: 'yes_decoration',
  parking: 'yes_parking',
  buffet_id: 2,
  venue_preference: 'no_preference',
  base_price: 15000,
  additional_per_person: 375,
  value_extra_hour: 2500,
  base_price_weekend: 22500,
  additional_per_person_weekend: 563,
  value_extra_hour_weekend: 3750
)

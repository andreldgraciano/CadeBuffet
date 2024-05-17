require 'rails_helper'

describe 'A partir da home' do
  it 'cliente se conecta com sucesso' do
    Client.create!(
      email: 'andre@gmail.com',
      name: 'André Dias',
      cpf: 65971070045,
      password: 'andre123@',
    )

    visit(root_path)
    within('#client_login') do
      click_on('Log in')
    end
    within('form#new_client') do
      fill_in('Email', with: 'andre@gmail.com')
      fill_in('Password', with: 'andre123@')
      click_on('Log in')
    end

    expect(current_path).to eq(buffets_path)
    expect(page).to have_content('My Orders')
    expect(page).to have_content('André Dias')
    expect(page).to have_content('Signed in successfully')
  end

  it 'client se conecta e desconecta com sucesso' do
    client = Client.create!(
      email: 'andre@gmail.com',
      name: 'André Dias',
      cpf: 65971070045,
      password: 'andre123@',
    )

    login_as(client, :scope => :client)
    visit(root_path)
    click_on('Sign Out')

    expect(current_path).to eq(buffets_path)
    expect(page).not_to have_content('André Dias')
    expect(page).to have_content('Signed out successfully')
  end

  it 'cliente conectado vê lista de buffets' do
    buffet_profile = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
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
      buffet_profile_id: buffet_profile.id,
      payment: 1,
    )
    client = Client.create!(
      email: 'andre@gmail.com',
      name: 'André Dias',
      cpf: 65971070045,
      password: 'andre123@',
    )

    visit(root_path)
    login_as(client, :scope => :client)

    expect(current_path).to eq(buffets_path)
    expect(page).to have_link('Buffet Real Palace')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_content('MG')
  end

  it 'cliente conectado vê detalhes de um buffet e não vê de outros' do
    buffet_profile_1 = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
    )
    buffet_profile_2 = BuffetProfile.create!(
      email: 'elegance@gmail.com',
      password: 'elegance123@'
    )
    buffet_1 = Buffet.create!(
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
    client = Client.create!(
      email: 'andre@gmail.com',
      name: 'André Dias',
      cpf: 65971070045,
      password: 'andre123@',
    )

    login_as(client, :scope => :client)
    visit(root_path)
    click_on('Buffet Real Palace')

    expect(current_path).to eq(buffet_path(buffet_1.id))
    expect(page).to have_content('Buffet Real Palace')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_content('MG')
    expect(page).to have_content('Festa de Casamento Villa')
    expect(page).to have_content('Rua das Palmeiras, 61, Esplanada, MG - Ipatinga')
    expect(page).to have_content('Salgados, Refrigerante, Suco, Cerveja, Prato Principal')
    expect(page).not_to have_content('Buffet Elegance')
    expect(page).not_to have_content('São Paulo')
    expect(page).not_to have_content('SP')
    expect(page).not_to have_content('Aniversário')
    expect(page).not_to have_content('Avenida das Flores, 123, Centro, SP - São Paulo')
    expect(page).not_to have_content('Salgadinhos, Bolo, Refrigerante, Docinhos')
    expect(page).to have_link('Place Order')
    expect(page).to have_link('Back')
  end
end

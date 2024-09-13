require 'rails_helper'

describe 'cliente faz pedido de evento' do
  it 'com sucesso' do
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
    event_date = 1.week.from_now.to_date
    formatted_date = event_date.strftime('%Y-%m-%d')

    login_as(client, :scope => :client)
    visit(root_path)
    click_on('Buffet Real')
    within("div##{event.id}") do
      click_on('Place Order')
    end
    fill_in('Event day', with: formatted_date)
    fill_in('Amount people', with: 150)
    fill_in('Extra hour', with: 1)
    fill_in('Details', with: 'Quero muita decoração')
    click_on('Create Order')

    expect(page).to have_content('Festa de Casamento Villa')
    expect(page).to have_content(formatted_date)
    expect(page).to have_content('Order registered successfully')
    expect(page).to have_content('Waiting for buffet review')
    expect(page).to have_content('Cancel')
    expect(page).to have_content('Back to my Orders')
  end

  it 'falha por dados em branco' do
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
    event_date = 1.week.ago.to_date
    formatted_date = event_date.strftime('%Y-%m-%d')

    login_as(client, :scope => :client)
    visit(root_path)
    click_on('Buffet Real')
    within("div##{event.id}") do
      click_on('Place Order')
    end
    fill_in('Event day', with: formatted_date)
    fill_in('Amount people', with: '')
    fill_in('Extra hour', with: 3)
    fill_in('Details', with: 'Quero muita decoração')
    click_on('Create Order')


    expect(page).to have_content('Request not registered')
    expect(page).to have_content('Check the errors below:')
    expect(page).to have_content("Amount people can't be blank")
    expect(page).to have_content('Event day must be a future date')
  end
end

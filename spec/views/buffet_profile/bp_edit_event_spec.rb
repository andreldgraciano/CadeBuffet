require 'rails_helper'

describe 'profile buffet atualiza dados de um evento' do

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

    login_as(buffet_profile, :scope => :buffet_profile)
    visit(root_path)
    within("div##{event.id}") do
      click_on('Edit Event')
    end
    fill_in('Description', with: 'Celebre o noivado em grande estilo')
    fill_in('Address', with: 'Praia do Ano Novo, S/N, Litoral, BA - Salvador')
    select('No alcohol', from: 'Alcoholic drink')
    click_on('Update Event')

    within("div##{event.id}") do
      expect(current_path).to eq(home_buffet_profile_path)
      expect(page).to have_content('Celebre o noivado em grande estilo')
      expect(page).to have_content('Praia do Ano Novo, S/N, Litoral, BA - Salvador')
      expect(page).to have_content('no_alcohol')
      expect(page).not_to have_content('Garantimos um dia inesquecivel para o casal')
      expect(page).not_to have_content('Rua das Palmeiras, 61, Esplanada, MG - Ipatinga')
      expect(page).not_to have_content('yes_alcohol')
    end
  end

  it 'e falha por deixar campos em branco' do

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

    login_as(buffet_profile, :scope => :buffet_profile)
    visit(root_path)
    within("div##{event.id}") do
      click_on('Edit Event')
    end
    fill_in('Description', with: '')
    fill_in('Address', with: '')
    click_on('Update Event')

    expect(current_path).to eq(event_path(event.id))
    expect(page).to have_content('Event could not be updated')
    expect(page).to have_content('Check the errors below:')
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Address can't be blank")
  end

  # it 'e falha por tentar alterar para um brand_name e email já existentes' do

  #   buffet_profile_1 = BuffetProfile.create!(
  #     email: 'real@gmail.com',
  #     password: 'real123@'
  #   )
  #   buffet_profile_2 = BuffetProfile.create!(
  #     email: 'elegance@gmail.com',
  #     password: 'elegance123@'
  #   )
  #   buffet_1 = Buffet.create!(
  #     brand_name: 'Buffet Real',
  #     corporate_name: 'Buffet Real LTDA',
  #     registration_number: 84078858000169,
  #     phone: 3127526712,
  #     email: 'sac@buffetreal.com',
  #     address: 'Praça das Tribos, 123',
  #     district: 'Iguaçu',
  #     state: 'MG',
  #     city: 'Ipatinga',
  #     zip_code: 35162133,
  #     description: 'Um buffet completo para o seu evento',
  #     buffet_profile_id: buffet_profile_1.id,
  #     payment: 1
  #   )
  #   buffet_2 = Buffet.create!(
  #     brand_name: 'Buffet Elegance',
  #     corporate_name: 'Elegances Buffet LTDA',
  #     registration_number: 72279600000141,
  #     phone: 1426272593,
  #     email: 'sac@elegancebuffet.com',
  #     address: 'Rua Francesco Tessarin, 435',
  #     district: 'Recanto Verde do Sol',
  #     state: 'SP',
  #     city: 'São Paulo',
  #     zip_code: 18382240,
  #     description: 'Um show de elegancia para o seu buffet',
  #     buffet_profile_id: buffet_profile_2.id,
  #     payment: 0
  #   )

  #   login_as(buffet_profile_2, :scope => :buffet_profile)
  #   visit(root_path)
  #   click_on('Edit buffet')
  #   fill_in('Brand name', with: 'Buffet Real')
  #   fill_in('Email', with: 'sac@buffetreal.com')
  #   click_on('Update Buffet')

  #   expect(current_path).to eq(buffet_path(buffet_2.id))
  #   expect(page).to have_content("Buffet could not be updated")
  #   expect(page).to have_content("Check the errors below:")
  #   expect(page).to have_content("Brand name has already been taken")
  #   expect(page).to have_content("Email has already been taken")
  # end
end

require 'rails_helper'

describe 'profile buffet atualiza dados do buffet' do

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

    login_as(buffet_profile, :scope => :buffet_profile)
    visit(root_path)
    click_on('Edit buffet')
    fill_in('District', with: 'Ipapemba')
    fill_in('Description', with: 'Um show de elegancia para o seu buffet')
    fill_in('Phone', with: 33991544741)
    click_on('Update Buffet')

    expect(current_path).to eq(home_buffet_profile_path)
    expect(page).to have_content('Ipapemba')
    expect(page).to have_content('Um show de elegancia para o seu buffet')
    expect(page).to have_content(33991544741)
    expect(page).not_to have_content('Iguaçu')
    expect(page).not_to have_content('Um buffet completo para o seu evento')
    expect(page).not_to have_content(3127526712)
  end

  it 'e falha por deixar campos em branco ' do
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

    login_as(buffet_profile, :scope => :buffet_profile)
    visit(root_path)
    click_on('Edit buffet')
    fill_in('District', with: '')
    fill_in('Description', with: '')
    fill_in('Phone', with: '')
    click_on('Update Buffet')

    expect(current_path).to eq(buffet_path(buffet.id))
    expect(page).to have_content("Buffet could not be updated")
    expect(page).to have_content("Check the errors below:")
    expect(page).to have_content("Phone can't be blank")
    expect(page).to have_content("District can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  it 'e falha por tentar alterar para um brand_name e email já existentes' do

    buffet_profile_1 = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@'
    )
    buffet_profile_2 = BuffetProfile.create!(
      email: 'elegance@gmail.com',
      password: 'elegance123@'
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

    login_as(buffet_profile_2, :scope => :buffet_profile)
    visit(root_path)
    click_on('Edit buffet')
    fill_in('Brand name', with: 'Buffet Real')
    fill_in('Email', with: 'sac@buffetreal.com')
    click_on('Update Buffet')

    expect(current_path).to eq(buffet_path(buffet_2.id))
    expect(page).to have_content("Buffet could not be updated")
    expect(page).to have_content("Check the errors below:")
    expect(page).to have_content("Brand name has already been taken")
    expect(page).to have_content("Email has already been taken")
  end
end

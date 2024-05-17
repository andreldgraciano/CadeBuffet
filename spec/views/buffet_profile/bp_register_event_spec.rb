require 'rails_helper'

describe 'Usuario conecta como buffet_profile' do

  it 'e registra um evento com sucesso' do
    buffet_profile = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
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
    click_on('Register Event +')
    fill_in('Name', with: 'Festa junina')
    fill_in('Description', with: 'Um arraiá dos bao')
    fill_in('Min people', with: 100)
    fill_in('Max people', with: 200)
    fill_in('Duration', with: 180)
    fill_in('Base price', with: 3000)
    fill_in('Additional per person', with: 300)
    fill_in('Value extra hour', with: 1000)
    fill_in('Base price weekend', with: 4500)
    fill_in('Additional per person weekend', with: 450)
    fill_in('Value extra hour weekend', with: 1500)
    fill_in('Menu', with: 'Canjicão, rapadura, quentão e pão de queijo')
    fill_in('Address', with: 'Avenida das rosaceas, 123, centro')
    select('No decoration', from: 'Decoration')
    select('Yes alcohol', from: 'Alcoholic drink')
    select('No preference', from: 'Venue preference')
    select('Yes parking', from: 'Parking')
    click_on('Create Event')

    expect(page).to have_content('Buffet Real')
    expect(page).to have_content('sac@buffetreal.com')
    expect(page).to have_content('Avenida das rosaceas, 123, centro')
    expect(page).to have_content('Festa junina')
    expect(page).to have_content('Um arraiá dos bao')
    expect(page).to have_content('Canjicão, rapadura, quentão e pão de queijo')
    expect(page).to have_content('yes_parking')
  end
end

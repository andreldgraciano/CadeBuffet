require 'rails_helper'

describe 'Usuario conecta como buffet_profile' do

  it 'registra seu buffet e vai para tela do buffet' do
    buffet_profile = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
    )

    login_as(buffet_profile, :scope => :buffet_profile)
    visit(root_path)
    fill_in('Brand name', with: 'Buffet Real')
    fill_in('Corporate name', with: 'Buffet Real LTDA')
    fill_in('Registration number', with: 30994849000199)
    fill_in('Phone', with: 3737889747)
    fill_in('Email', with: 'sac@buffetreal.com')
    fill_in('Address', with: 'Avenida São João 290')
    fill_in('District', with: 'Arandutaba')
    fill_in('State', with: 'MG')
    fill_in('City', with: 'Campo Belo')
    fill_in('Zip code', with: 37270971)
    fill_in('Description', with: 'Um buffet a altura do seu evento')
    select('Cash', from: 'Payment')
    click_on('Create Buffet')

    expect(page).not_to have_content('Register your buffet')
    expect(page).to have_content('Buffet registered successfully')
    expect(page).to have_link('Orders')
    expect(page).to have_link('Register Event +')
    expect(page).to have_content('There are no events registered for this buffet')
    expect(page).to have_content('Buffet Real')
    expect(page).to have_content(30994849000199)
    expect(page).to have_content('Um buffet a altura do seu evento')
    expect(page).to have_content('Cash')
    expect(page).to have_link('Edit buffet')
  end


end

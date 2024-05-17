require 'rails_helper'

describe 'Visitante a partir da home' do
  it 'e acessa pagina para se conectar como buffet_profile' do
    # Arrange

    visit(root_path)
    within('#buffet_profile_login') do
      click_on('Log in')
    end

    expect(current_path).to eq(new_buffet_profile_session_path)
    expect(page).to have_content('Log in as buffet_profile')
  end

  it 'se conecta com sucesso como buffet_profile' do
    buffet_profile = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
    )
    Buffet.create!(
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

    visit(root_path)
    within('#buffet_profile_login') do
      click_on('Log in')
    end
    within('form#new_buffet_profile') do
      fill_in('Email', with: 'real@gmail.com')
      fill_in('Password', with: 'real123@')
      click_on('Log in')
    end

    expect(current_path).to eq(home_buffet_profile_path)
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Buffet Real')
    expect(page).to have_content('MG')
    expect(page).to have_content('Ipatinga')
  end

  it 'e acessa pagima para se conectar como client' do
    # Arrange

    visit(root_path)
    within('#client_login') do
      click_on('Log in')
    end

    expect(current_path).to eq(new_client_session_path)
    expect(page).to have_content('Log in as Client')
  end

  it 'se conecta com sucesso como client' do
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
    expect(page).to have_content('André Dias')
    expect(page).to have_content('Signed in successfully')
  end
end

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
end

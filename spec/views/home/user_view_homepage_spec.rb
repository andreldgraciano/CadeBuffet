require 'rails_helper'

describe 'Visitante acessa tela inicial' do
  it 'e vê o nome da app' do
    # Arrange

    visit(root_path)

    expect(page).to have_content('CADE BUFFET?')
  end

  it 'e vê campo de login de clientes' do
    # Arrange

    visit(root_path)

    within('#client_login') do
      expect(page).to have_link('Conectar')
      expect(page).to have_link('Cadastrar')
    end
  end

  it 'e vê campo de login de buffet_profile' do
    # Arrange

    visit(root_path)

    within('#buffet_profile_login') do
      expect(page).to have_link('Conectar')
      expect(page).to have_link('Cadastrar')
    end
  end

  it 'e não tem buffet cadastrado' do
    # Arrange

    visit(root_path)

    expect(page).to have_content('Não existem buffets cadastrados')
  end

  it 'e vê buffets cadastrados' do
    buffet_profile_1 = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
    )
    buffet_profile_2 = BuffetProfile.create!(
      email: 'elegance@gmail.com',
      password: 'elegance123@',
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
      buffet_profile_id: buffet_profile_1.id,
      payment: 1,
    )
    Buffet.create!(
      brand_name: 'Buffet Elegance',
      corporate_name: 'Elegances Buffet LTDA',
      registration_number: 41312312,
      phone: 33998948372,
      email: 'sac@elegancebuffet.com',
      address: 'Avenida da luz, 435',
      district: 'Fabricas',
      state: 'SP',
      city: 'São Paulo',
      zip_code: 7454562514,
      description: 'Um show de elegancia para o seu buffet',
      buffet_profile_id: buffet_profile_2.id,
      payment: 1,
    )

    visit(root_path)

    expect(page).to have_lnk('Buffet Real')
    expect(page).to have_content('MG')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_link('Buffet Elegance')
    expect(page).to have_content('SP')
    expect(page).to have_content('São Paulo')
  end

  it 'e vê detalhes de um buffet' do
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
    click_on('Buffet Real')

    expect(page).to have_content('Buffet Real')
    expect(page).to have_content(546546465)
    expect(page).to have_content(32998941245)
    expect(page).to have_content('sac@buffetreal.com')
    expect(page).to have_content('Rua Florianopolis, 123')
    expect(page).to have_content('Centro')
    expect(page).to have_content('MG')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_content(35322124)
    expect(page).to have_content('Um buffet completo para o seu evento')

  end
end

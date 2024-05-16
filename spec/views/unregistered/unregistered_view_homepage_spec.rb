require 'rails_helper'

describe 'Visitante acessa tela inicial' do
  it 'e é direcionada para lista de buffets' do
    # Arrange

    visit(root_path)

    expect(current_path).to eq(buffets_path)
  end

  it 'e vê o nome da app' do
    # Arrange

    visit(root_path)

    expect(page).to have_content('CADE BUFFET?')
  end

  it 'e vê caixa de pesquisa' do
    # Arrange

    visit(root_path)

    within('form') do
      expect(page).to have_content('Search for')
      expect(page).to have_button('Search')
      expect(page).to have_field("query")
    end
  end

  it 'e faz uma pesquisa' do
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
      payment: 0,
    )

    visit(root_path)

    within('form#search') do
      fill_in('Search for:', with: 'villas')
    end
  end

  it 'e vê campo de login de clientes' do
    # Arrange

    visit(root_path)

    within('#client_login') do
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end
  end

  it 'e vê campo de login de buffet_profile' do
    # Arrange

    visit(root_path)

    within('#buffet_profile_login') do
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end
  end

  it 'e vê que não tem buffet cadastrado' do
    # Arrange

    visit(root_path)

    expect(page).to have_content('There are no registered buffets')
  end
end

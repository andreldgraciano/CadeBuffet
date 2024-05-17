require 'rails_helper'

describe 'Visitante faz pesquisa' do
  it 'com sucesso' do
    buffet_profile_1 = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
    )
    buffet_profile_2 = BuffetProfile.create!(
      email: 'elegance@gmail.com',
      password: 'elegance123@',
    )
    buffet_profile_3 = BuffetProfile.create!(
      email: 'villaspalace@gmail.com',
      password: 'villaspalace123@',
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
    buffet_3 = Buffet.create!(
      brand_name: 'Buffet Villas Palace',
      corporate_name: 'Buffet Villas Palace LTDA',
      registration_number: 13279305000126,
      phone: 2826376443,
      email: 'sac@villaspalace.com',
      address: 'Travessa São Bartolomeu, 35',
      district: 'do Quadro',
      state: 'ES',
      city: 'Vitória',
      zip_code: 7454562514,
      description: 'Um show de elegancia para o seu buffet',
      buffet_profile_id: buffet_profile_3.id,
      payment: 0,
    )

    visit(root_path)

    within('form#search') do
      fill_in('Search for:', with: 'palace')
      click_on('Search')
    end

    expect(page).to have_content('Buffet Real Palace')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_content('MG')
    expect(page).to have_content('Buffet Villas Palace')
    expect(page).to have_content('Vitória')
    expect(page).to have_content('ES')
  end

  it 'com sucesso' do
    buffet_profile_1 = BuffetProfile.create!(
      email: 'real@gmail.com',
      password: 'real123@',
    )
    buffet_profile_2 = BuffetProfile.create!(
      email: 'elegance@gmail.com',
      password: 'elegance123@',
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
      click_on('Search')
    end

    expect(page).to have_content('Search for "villas" not found')
    expect(page).not_to have_content('Buffet Real Palace')
    expect(page).not_to have_content('Buffet Elegance')
  end
end

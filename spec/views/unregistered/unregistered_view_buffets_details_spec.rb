require 'rails_helper'

describe 'A partir da home, Visitante acessa buffet' do
  it 'e volta para pagina inicial' do
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
    click_on('Back')

    expect(current_path).to eq(buffets_path)
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

    expect(page).to have_link('Buffet Real')
    expect(page).to have_content('MG')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_link('Buffet Elegance')
    expect(page).to have_content('SP')
    expect(page).to have_content('São Paulo')
  end

  it 'e vê detalhes de um buffet sem evento cadastrado' do
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

    expect(current_path).to eq(buffet_path(buffet_profile.id))
    expect(page).to have_content('Buffet Real')
    expect(page).to have_content('Um buffet completo para o seu evento')
    expect(page).to have_content(546546465)
    expect(page).to have_content(32998941245)
    expect(page).to have_content('sac@buffetreal.com')
    expect(page).to have_content('Rua Florianopolis, 123')
    expect(page).to have_content('Centro')
    expect(page).to have_content('MG')
    expect(page).to have_content('Ipatinga')
    expect(page).to have_content(35322124)
    expect(page).to have_content('Cash_and_Card')
    expect(page).to have_content('There are no events registered for this buffet')
  end

  it 'e vê detalhes de um buffet com evento cadastrado' do
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
    buffet_2 = Buffet.create!(
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
    Event.create!(
      name: 'Festa de 15 anos',
      description: 'Um evento memorável para uma debutante especial',
      min_people: 100,
      max_people: 200,
      duration: 180,
      menu: 'Bolo, Doces, Salgados, Refrigerante, Suco, Massas',
      address: 'Avenida das Flores, 321, Centro, MG - Caratinga',
      alcoholic_drink: 'yes_alcohol',
      decoration: 'no_decoration',
      parking: 'yes_parking',
      buffet_id: buffet_2.id,
      venue_preference: 'yes_preference',
      base_price: 10000,
      additional_per_person: 100,
      value_extra_hour: 2000,
      base_price_weekend: 15000,
      additional_per_person_weekend: 150,
      value_extra_hour_weekend: 3000
    )

    visit(root_path)
    click_on('Buffet Elegance')

    expect(page).to have_content('Buffet Elegance')
    expect(page).not_to have_content('There are no events registered for this buffet')
    expect(page).to have_content('Festa de 15 anos')
    expect(page).to have_content('Um evento memorável para uma debutante especial')
    expect(page).to have_content('Avenida das Flores, 321, Centro, MG - Caratinga')
    expect(page).to have_content('Bolo, Doces, Salgados, Refrigerante, Suco, Massas')
    expect(page).to have_content(100)
    expect(page).to have_content(200)
    expect(page).to have_content(180)
    expect(page).to have_content(10000)
    expect(page).to have_content(100)
    expect(page).to have_content(2000)
    expect(page).to have_content(15000)
    expect(page).to have_content(150)
    expect(page).to have_content(3000)
    expect(page).to have_content('yes_preference')
    expect(page).to have_content('yes_alcohol')
    expect(page).to have_content('no_decoration')
    expect(page).to have_content('yes_parking')
  end

  it 'e não vê detalhes de evento de outros buffets' do
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
    Event.create!(
      name: 'Festa de Casamento',
      description: 'Garantimos um dia inesquecivel para o casal',
      min_people: 150,
      max_people: 250,
      duration: 240,
      menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
      address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
      alcoholic_drink: 'yes_alcohol',
      decoration: 'yes_decoration',
      parking: 'yes_parking',
      buffet_id: 1,
      venue_preference: 'no_preference',
      base_price: 15000,
      additional_per_person: 450,
      value_extra_hour: 3000,
      base_price_weekend: 25000,
      additional_per_person_weekend: 750,
      value_extra_hour_weekend: 5000
    )
    Event.create!(
      name: 'Festa de 15 anos',
      description: 'Um evento memorável para uma debutante especial',
      min_people: 100,
      max_people: 200,
      duration: 180,
      menu: 'Bolo, Doces, Salgados, Refrigerante, Suco, Massas',
      address: 'Avenida das Flores, 321, Centro, MG - Caratinga',
      alcoholic_drink: 'yes_alcohol',
      decoration: 'no_decoration',
      parking: 'yes_parking',
      buffet_id: 2,
      venue_preference: 'yes_preference',
      base_price: 10000,
      additional_per_person: 100,
      value_extra_hour: 2000,
      base_price_weekend: 15000,
      additional_per_person_weekend: 150,
      value_extra_hour_weekend: 3000
    )

    visit(root_path)
    click_on('Buffet Real')

    expect(page).to have_content('Buffet Real')
    expect(page).not_to have_content('Buffet Elegance')
    expect(page).to have_content('Festa de Casamento')
    expect(page).to have_content('Garantimos um dia inesquecivel para o casal')
    expect(page).to have_content(150)
    expect(page).to have_content(250)
    expect(page).to have_content(240)
    expect(page).to have_content(15000)
    expect(page).to have_content(450)
    expect(page).to have_content(3000)
    expect(page).to have_content(25000)
    expect(page).to have_content(750)
    expect(page).to have_content(5000)
    expect(page).to have_content('Salgados, Refrigerante, Suco, Cerveja, Prato Principal')
    expect(page).to have_content('Rua das Palmeiras, 61, Esplanada, MG - Ipatinga')
    expect(page).to have_content('no_preference')
    expect(page).to have_content('yes_alcohol')
    expect(page).to have_content('yes_decoration')
    expect(page).to have_content('yes_parking')
    expect(page).not_to have_content('Festa de 15 anos')
    expect(page).not_to have_content('Um evento memorável para uma debutante especial')
    expect(page).not_to have_content('Bolo, Doces, Salgados, Refrigerante, Suco, Massas')
    expect(page).not_to have_content('Avenida das Flores, 321, Centro, MG - Caratinga')
  end
end

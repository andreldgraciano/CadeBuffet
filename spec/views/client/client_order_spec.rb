require 'rails_helper'

describe 'client atualiza status de pedido' do
  it 'confirmado com sucesso' do
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
    client = Client.create!(
      email: 'andre@gmail.com',
      name: 'André Dias',
      cpf: 65971070045,
      password: 'andre123@'
    )
    event_date = 1.month.from_now.to_date
    formatted_date = event_date.strftime('%Y-%m-%d')
    order = Order.create!(
        buffet_id: buffet.id,
        event_id: event.id,
        client_id: client.id,
        event_day: formatted_date,
        amount_people: 160,
        details: 'Detalhes do pedido',
    )

    order.update!(status: 'Order accepted by buffet')
    login_as(client, :scope => :client)
    visit(root_path)
    click_on('My Orders')
    click_on("Order #{order.code}")
    click_on('Confirm')

    expect(page).to have_content('Order confirmed by the client')
  end

  it 'cancela com sucesso' do
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
    client = Client.create!(
      email: 'andre@gmail.com',
      name: 'André Dias',
      cpf: 65971070045,
      password: 'andre123@'
    )
    event_date = 1.month.from_now.to_date
    formatted_date = event_date.strftime('%Y-%m-%d')
    order = Order.create!(
        buffet_id: buffet.id,
        event_id: event.id,
        client_id: client.id,
        event_day: formatted_date,
        amount_people: 160,
        details: 'Detalhes do pedido',
    )

    order.update!(status: 'Order accepted by buffet')
    login_as(client, :scope => :client)
    visit(root_path)
    click_on('My Orders')
    click_on("Order #{order.code}")
    click_on('Cancel')

    expect(page).to have_content('canceled order')
    expect(page).to have_content('Order canceled successfully')
  end

  it 'tenta acessar pedido de oturo cliente' do
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
    client_1 = Client.create!(
      email: 'client_1@gmail.com',
      name: 'Nome client_1',
      cpf: 65971070045,
      password: 'andre123@'
    )
    client_2 = Client.create!(
      email: 'client_2@gmail.com',
      name: 'Nome client_2',
      cpf: 54420627077,
      password: 'andre123@'
    )
    event_date_1 = 1.month.from_now.to_date
    event_date_2 = 2.month.from_now.to_date
    formatted_date_1 = event_date_1.strftime('%Y-%m-%d')
    formatted_date_2 = event_date_2.strftime('%Y-%m-%d')
    order = Order.create!(
        buffet_id: buffet.id,
        event_id: event.id,
        client_id: client_1.id,
        event_day: formatted_date_1,
        amount_people: 160,
        details: 'Detalhes do pedido',
    )
    order = Order.create!(
      buffet_id: buffet.id,
      event_id: event.id,
      client_id: client_2.id,
      event_day: formatted_date_2,
      amount_people: 160,
      details: 'Detalhes do pedido',
    )
    order.update!(status: 'Order accepted by buffet')
    login_as(client_2, :scope => :client)
    visit(root_path)
    visit(order_path(1))

    expect(page).to have_content('You are not allowed to access orders from other clients')
  end
end

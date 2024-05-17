require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#valid?' do
    it 'falso quando name é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando description é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando min_people é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando max_people é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando duration é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando menu é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando address é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando alcoholic_drink é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando decoration é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: 'yes_alcohol',
        decoration: '',
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

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando parking é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: '',
        buffet_id: buffet.id,
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando buffet_id é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
        description: 'Garantimos um dia inesquecivel para o casal',
        min_people: 150,
        max_people: 250,
        duration: 240,
        menu: 'Salgados, Refrigerante, Suco, Cerveja, Prato Principal',
        address: 'Rua das Palmeiras, 61, Esplanada, MG - Ipatinga',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: '',
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando venue_preference é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        venue_preference: '',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando base_price é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        base_price: '',
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando additional_per_person é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        additional_per_person: '',
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando value_extra_hour é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        value_extra_hour: '',
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando base_price_weekend é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        base_price_weekend: '',
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando additional_per_person_weekend é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        additional_per_person_weekend: '',
        value_extra_hour_weekend: 5000
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando value_extra_hour_weekend é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      buffet = Buffet.create!(
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

      event = Event.new(
        name: 'Aniversário',
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
        value_extra_hour_weekend: ''
      )

      result = event.valid?

      expect(result).to eq(false)
    end

    it 'falso quando name é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )
      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
      event_1 = Event.create!(
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
        buffet_id: buffet_1.id,
        venue_preference: 'no_preference',
        base_price: 15000,
        additional_per_person: 450,
        value_extra_hour: 3000,
        base_price_weekend: 25000,
        additional_per_person_weekend: 750,
        value_extra_hour_weekend: 5000
      )
      event_2 = Event.new(
        name: 'Festa de Casamento Villa',
        description: 'Celebre um aniversário em grande estilo!',
        min_people: 50,
        max_people: 100,
        duration: 180,
        menu: 'Salgadinhos, Bolo, Refrigerante, Docinhos',
        address: 'Avenida das Flores, 123, Centro, SP - São Paulo',
        alcoholic_drink: 'yes_alcohol',
        decoration: 'yes_decoration',
        parking: 'yes_parking',
        buffet_id: buffet_2.id,
        venue_preference: 'no_preference',
        base_price: 8000,
        additional_per_person: 200,
        value_extra_hour: 1500,
        base_price_weekend: 12000,
        additional_per_person_weekend: 300,
        value_extra_hour_weekend: 2000
      )

      result = event_2.valid?

      expect(result).to eq(false)
    end

  end
end

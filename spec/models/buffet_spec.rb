require 'rails_helper'

RSpec.describe Buffet, type: :model do

  describe '#valid?' do

    it 'falso quando brand_name é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: '',
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

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando corporate_name é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: '',
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

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando registration_number é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: '',
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

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando phone é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: '',
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

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando email é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: '',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando address é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: '',
        district: 'Iguaçu',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando district é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: '',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando state é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: '',
        city: 'Ipatinga',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando city é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: 'MG',
        city: '',
        zip_code: 35162133,
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando zip_code é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Buffet Real LTDA',
        registration_number: 84078858000169,
        phone: 3127526712,
        email: 'sac@buffetreal.com',
        address: 'Praça das Tribos, 123',
        district: 'Iguaçu',
        state: 'MG',
        city: 'Ipatinga',
        zip_code: '',
        description: 'Um buffet completo para o seu evento',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando description é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
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
        description: '',
        buffet_profile_id: buffet_profile.id,
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando buffet_profile_id é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
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
        buffet_profile_id: '',
        payment: 1
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando payment é vazio' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )
      buffet = Buffet.new(
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
        payment: ''
      )

      result = buffet.valid?

      expect(result).to eq(false)
    end

    it 'falso quando brand_name é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )

      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )

      buffet_2 = Buffet.new(
        brand_name: 'Buffet Real',
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

      result = buffet_2.valid?

      expect(result).to eq(false)
    end

    it 'falso quando corporate_name é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )

      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )

      buffet_2 = Buffet.new(
        brand_name: 'Buffet Elegance',
        corporate_name: 'Buffet Real LTDA',
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

      result = buffet_2.valid?

      expect(result).to eq(false)
    end

    it 'falso quando registration_number é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )

      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )

      buffet_2 = Buffet.new(
        brand_name: 'Buffet Elegance',
        corporate_name: 'Elegances Buffet LTDA',
        registration_number: 84078858000169,
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

      result = buffet_2.valid?

      expect(result).to eq(false)
    end

    it 'falso quando phone é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )

      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )

      buffet_2 = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Elegances Buffet LTDA',
        registration_number: 72279600000141,
        phone: 3127526712,
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

      result = buffet_2.valid?

      expect(result).to eq(false)
    end

    it 'falso quando email é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )

      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )

      buffet_2 = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Elegances Buffet LTDA',
        registration_number: 72279600000141,
        phone: 1426272593,
        email: 'sac@buffetreal.com',
        address: 'Rua Francesco Tessarin, 435',
        district: 'Recanto Verde do Sol',
        state: 'SP',
        city: 'São Paulo',
        zip_code: 18382240,
        description: 'Um show de elegancia para o seu buffet',
        buffet_profile_id: buffet_profile_2.id,
        payment: 0
      )

      result = buffet_2.valid?

      expect(result).to eq(false)
    end

    it 'falso quando address é repetido' do
      buffet_profile_1 = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@'
      )

      buffet_profile_2 = BuffetProfile.create!(
        email: 'elegance@gmail.com',
        password: 'elegance123@'
      )
      buffet_1 = Buffet.create!(
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
        buffet_profile_id: buffet_profile_1.id,
        payment: 1
      )

      buffet_2 = Buffet.new(
        brand_name: 'Buffet Real',
        corporate_name: 'Elegances Buffet LTDA',
        registration_number: 72279600000141,
        phone: 1426272593,
        email: 'sac@elegancebuffet.com',
        address: 'Praça das Tribos, 123',
        district: 'Recanto Verde do Sol',
        state: 'SP',
        city: 'São Paulo',
        zip_code: 18382240,
        description: 'Um show de elegancia para o seu buffet',
        buffet_profile_id: buffet_profile_2.id,
        payment: 0
      )

      result = buffet_2.valid?

      expect(result).to eq(false)
    end

  end
end

require 'rails_helper'

describe 'Visitante faz cadastro' do
  context 'para um perfil de buffet' do
    it 'e acessa tela de cadastro' do
      # Arrange

      visit(root_path)
      within('#buffet_profile_login') do
        click_on('Sign Up')
      end

      expect(current_path).to eq(new_buffet_profile_registration_path)
    end

    it 'com sucesso e direcionado para criar buffet' do
      # Arrange

      visit(root_path)
      within('#buffet_profile_login') do
        click_on('Sign Up')
      end
      within('form#new_buffet_profile') do
        fill_in('Email', with: 'real@gmail.com')
        fill_in('Password', with: 'real123@')
        fill_in('Password confirmation', with: 'real123@')
        click_on('Sign up')
      end

      expect(current_path).to eq(new_buffet_path)
      expect(page).to have_content('Cadastre seu buffet')
    end
  end

  context 'como cliente' do
    it 'e acessa tela de cadastro de cliente' do
      # Arrange

      visit(root_path)
      within('#client_login') do
        click_on('Sign Up')
      end

      expect(current_path).to eq(new_client_registration_path)
    end

    it 'com sucesso e direcionado para lista de buffets' do
      # Arrange

      visit(root_path)
      within('#client_login') do
        click_on('Sign Up')
      end
      within('form#new_client') do
        fill_in('Email', with: 'andre@yahoo.com')
        fill_in('Name', with: 'André Dias')
        fill_in('Cpf', with: '32530969043')
        fill_in('Password', with: 'andre123@')
        fill_in('Password confirmation', with: 'andre123@')
        click_on('Sign up')
      end

      expect(current_path).to eq(buffets_path)
      expect(page).to have_content('André Dias')
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
end

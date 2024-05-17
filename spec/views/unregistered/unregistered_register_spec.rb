require 'rails_helper'

describe 'Visitante a partir da home' do
  it 'e acessa pagima para se registrar como buffet_profile' do
    # Arrange

    visit(root_path)
    within('#buffet_profile_login') do
      click_on('Sign up')
    end

    expect(current_path).to eq(new_buffet_profile_registration_path)
    expect(page).to have_content('Sign up as buffet_profile')
  end


  it 'se cadastra com sucesso como buffet_profile e é direcionado para criar buffet' do
    # Arrange

    visit(root_path)
    within('#buffet_profile_login') do
      click_on('Sign up')
    end
    within('form#new_buffet_profile') do
      fill_in('Email', with: 'real@gmail.com')
      fill_in('Password', with: 'real123@')
      fill_in('Password confirmation', with: 'real123@')
      click_on('Sign up')
    end

    expect(current_path).to eq(new_buffet_path)
    expect(page).to have_content('Register your buffet')
  end

  it 'e acessa pagima para se registrar como client' do
    # Arrange

    visit(root_path)
    within('#client_login') do
      click_on('Sign up')
    end

    expect(current_path).to eq(new_client_registration_path)
    expect(page).to have_content('Sign up as Client')
  end

  it 'se cadastra com sucesso como client e é direcionado para lista de buffets' do
    # Arrange

    visit(root_path)
    within('#client_login') do
      click_on('Sign up')
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

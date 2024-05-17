require 'rails_helper'

describe 'Visitante a partir da home' do
  it 'e acessa pagina para se conectar como buffet_profile' do
    # Arrange

    visit(root_path)
    within('#buffet_profile_login') do
      click_on('Log in')
    end

    expect(current_path).to eq(new_buffet_profile_session_path)
    expect(page).to have_content('Log in as buffet_profile')
  end

  it 'e acessa pagina para se conectar como client' do
    # Arrange

    visit(root_path)
    within('#client_login') do
      click_on('Log in')
    end

    expect(current_path).to eq(new_client_session_path)
    expect(page).to have_content('Log in as Client')
  end
end

require 'rails_helper' do
  describe 'A partir da home' do
    it 'buffet profile se conecta com sucesso' do
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
      within('#buffet_profile_login') do
        click_on('Log in')
      end
      within('form#new_buffet_profile') do
        fill_in('Email', with: 'real@gmail.com')
        fill_in('Password', with: 'real123@')
        click_on('Log in')
      end

      expect(current_path).to eq(home_buffet_profile_path)
      expect(page).to have_content('Signed in successfully')
      expect(page).to have_link('Orders')
      expect(page).to have_content('Buffet Real')
      expect(page).to have_content('MG')
      expect(page).to have_content(546546465)
      expect(page).to have_content('Ipatinga')
      expect(page).to have_content('Um buffet completo para o seu evento')
      expect(page).to have_link('Edit buffet')

    end

    it 'buffet profile se conecta e desconecta com sucesso' do
      buffet_profile = BuffetProfile.create!(
        email: 'real@gmail.com',
        password: 'real123@',
      )

      login_as(buffet_profile, :scope => :buffet_profile)
      visit(root_path)
      click_on('Sign Out')

      expect(current_path).to eq(buffets_path)
      expect(page).not_to have_link('Orders')
      expect(page).to have_content('Signed out successfully')
    end
  end
end

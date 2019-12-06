require 'rails_helper'

feature 'user sign in' do
  scenario 'from home page' do  

    user = User.create(email: 'roberson@gmail.com', password:'123456789')

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    
      within('form') do
        click_on 'Entrar'
      end
   
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{user.email}")

  end

  scenario 'does not see Log in link' do
    user = User.create(email: 'roberson@gmail.com', password:'123456789')

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    
    within('form') do
      click_on 'Entrar'
    end
    
    expect(page).not_to have_content('Log in')
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_link('Sair')
    
    end

    scenario 'and log out' do
      user = User.create(email: 'roberson@gmail.com', password:'123456789')
  
      visit root_path
      click_on 'Entrar'

      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      
      within('form') do
        click_on 'Entrar'
      end
      click_on 'Sair'
              
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Signed out successfully')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
     
    end
end


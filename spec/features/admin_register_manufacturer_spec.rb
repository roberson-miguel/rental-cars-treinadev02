require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'successfully' do
  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)


    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Fiat')
  end

  scenario 'and must fill in fields' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)

    visit new_manufacturer_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do fabricante')
  end

  scenario 'and name must be unique' do

    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)

    Manufacturer.create!(name: 'Fiat')

    visit new_manufacturer_path
    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'must be authenticated' do
    visit new_manufacturer_path

    expect(current_path).to eq(new_user_session_path)
  end

end
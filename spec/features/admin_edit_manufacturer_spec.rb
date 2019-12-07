require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    Manufacturer.create(name: 'Fiat')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('Honda')
  end

  scenario 'and must fill in all fields' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    Manufacturer.create(name: 'Fiat')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do fabricante')
  end

  scenario 'and must must be unique' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Honda')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end
end
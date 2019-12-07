require 'rails_helper'

feature 'Admin edit clients' do
  scenario 'successfully' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    Client.create!(name:'Roberson Miguel', document:'284.042.408-84', email:'xxxx')

    visit root_path
    click_on 'Clientes'
    click_on 'Roberson Miguel'
    click_on 'Editar'


    fill_in 'Nome', with: 'Roberson Miguel Santos'
    fill_in 'CPF', with: '284.042.408-84'
    fill_in 'Email', with: 'roberson@miguel.com'
    click_on 'Enviar'

    expect(page).to have_content('Roberson Miguel Santos')
    expect(page).to have_content('284.042.408-84')
    expect(page).to have_content('roberson@miguel.com')
   
  end

end
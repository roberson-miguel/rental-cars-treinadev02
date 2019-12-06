require 'rails_helper'

feature 'Admin register Client' do
  scenario 'successfully' do

    user = User.create(email: 'roberson@gmail.com', password:'123456789')

    login_as(user)

    visit root_path
    click_on 'Clientes'
    click_on 'Novo Cliente'

    fill_in 'Nome', with: 'Roberson Miguel'
    fill_in 'CPF', with: '284.042.408-84'
    fill_in 'Email', with: 'roberson@miguel.com'

    click_on 'Enviar'

    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('284.042.408-84')
    expect(page).to have_content('roberson@miguel.com')
  end

  scenario 'and must fill in fields' do
    user = User.create(email: 'roberson@gmail.com', password:'123456789')

    login_as(user)

    visit new_client_path
    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os campos')
  end

  scenario 'and cpf and email must be unique' do
    user = User.create(email: 'roberson@gmail.com', password:'123456789')

    login_as(user)

    Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    Client.create!(name: 'Elaine Cristina', document: '295.004.567-78', email: 'elaine@cristina.com')
    
    visit new_client_path
    fill_in 'Nome', with: 'Vitor Alves'
    fill_in 'CPF', with: '284.042.408-84'
    fill_in 'Email', with: 'roberson@milguel.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF ou Email já está em uso')
  end

  scenario 'must be authenticated' do
    visit new_client_path

    expect(current_path).to eq(new_user_session_path)
  end
end
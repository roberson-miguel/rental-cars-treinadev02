require 'rails_helper'

feature 'User register a rentals ' do
  scenario 'successfully as user' do
    client = Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
   
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :employed)
    
    login_as(user)

    visit root_path
    click_on 'Agendar Locação'
    click_on 'Novo Agendamento'
    
    fill_in 'Data Inicial', with: '23/12/2019'
    fill_in 'Data Final', with: '31/12/2019'
    select 'Roberson Miguel', from: 'Cliente'
    select 'A', from: 'Categoria'
    #select 'Confirmada', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('A')
    #expect(page).not_to have_content('confirmada')

  end

  scenario 'successfully as Admin' do
    client = Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 

    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)

    login_as(admin)

    visit root_path
    click_on 'Agendar Locação'
    click_on 'Novo Agendamento'
    
    fill_in 'Data Inicial', with: '23/12/2019'
    fill_in 'Data Final', with: '31/12/2019'
    select 'Roberson Miguel', from: 'Cliente'
    select 'A', from: 'Categoria'
    select 'Confirmada', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('A')
    expect(page).to have_content('confirmada')

  end

  scenario 'must be authenticated' do
    visit new_rental_path

    expect(current_path).to eq(new_user_session_path)
  end
  
end
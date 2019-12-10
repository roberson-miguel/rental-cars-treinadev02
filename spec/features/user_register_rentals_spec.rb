require 'rails_helper'

feature 'User register a rentals ' do
  scenario 'successfully as user' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    client = Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :employed, subsidiary: subsidiary)   
    login_as(user, scope: :user)

    visit root_path
    click_on 'Agendar Locação'
    click_on 'Novo Agendamento'
    
    fill_in 'Data Inicial', with: '2019-12-23'
    fill_in 'Data Final', with: '2019-12-31'
    select "#{client.name} - #{client.document}", from: 'Cliente'
    select 'A', from: 'Categoria'
    #select 'Confirmada', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('A')
    expect(page).to have_content('Código')
    expect(page).to have_content('Freguesia')
    expect(page).to have_content('roberson@gmail.com')
    #expect(page).to have_content('Confirmada')

  end

  xscenario 'data de inicio menor que data final' do
    #fazer
  end

  xscenario 'campos vazios' do
    #fazer
  end


  scenario 'must be authenticated' do
    visit new_rental_path

    expect(current_path).to eq(new_user_session_path)
  end
  
end
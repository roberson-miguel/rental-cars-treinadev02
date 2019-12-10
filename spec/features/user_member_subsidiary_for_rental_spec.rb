require 'rails_helper'

feature 'User is member this subsidiary for rentals' do

  scenario 'successfully ' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    client = Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :employed, )   
    login_as(user, scope: :user)

    
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Novo Agendamento'
    
    fill_in 'Data Inicial', with: '2019-12-23'
    fill_in 'Data Final', with: '2019-12-31'
    select "#{client.name} - #{client.document}", from: 'Cliente'
    select "#{car_category.name}", from: 'Categoria'
    #select 'In Progress', from: 'Status'
    select 'Freguesia', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('A')
    expect(page).to have_content('Código')
    expect(page).to have_content('in_progress')
    expect(page).to have_content('Freguesia')
  end

end
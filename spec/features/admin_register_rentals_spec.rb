require 'rails_helper'

feature 'Admin register a rentals ' do
  scenario 'successfully' do
    client = Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
   
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Novo Agendamento'
    
    fill_in 'Data Inicial', with: '23/12/2019'
    fill_in 'Data Final', with: '31/12/2019'
    select 'Roberson Miguel', from: 'Cliente'
    select 'A', from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('A')

  end

end
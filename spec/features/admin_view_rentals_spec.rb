require 'rails_helper'

feature 'Admin rental car' do
  scenario 'successfully' do
   
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '2019-12-23', end_date:'2019-12-31', client: client, car_category: car_category)
    
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos Coccato'
    
    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Marcos Coccato')
    expect(page).to have_content('A')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '2019-12-23', end_date:'2019-12-31', client: client, car_category: car_category)
    
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos Coccato'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
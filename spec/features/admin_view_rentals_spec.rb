require 'rails_helper'

feature 'Admin view rentals car' do
  scenario 'successfully' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)
    
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', 
                            client: client, car_category: car_category,
                            reservation_code: 999999, subsidiary: subsidiary)
    
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos Coccato'
    
    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Marcos Coccato')
    expect(page).to have_content('A')
    expect(page).to have_content("Código")
    expect(page).to have_content('Freguesia')
    expect(page).to have_link('Voltar')
    
  end

  scenario 'and return to home page' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)
 
    
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', 
                            client: client, car_category: car_category,
                            reservation_code: 'BBB123', subsidiary: subsidiary)
    
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos Coccato'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
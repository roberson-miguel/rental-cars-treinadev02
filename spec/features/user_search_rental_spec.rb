require 'rails_helper'

feature 'User search rental' do

  xscenario 'successfully ' do
    client = Client.create!(name: 'Roberson Santos', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    rental = Rental.create!(start_date: '2019-12-23', end_date:'2019-12-32', 
      client: client, car_category: car_category,
      reservation_code: 'ABC123', subsidiary: subsidiary)

    other_rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', 
      client: client, car_category: car_category,
      reservation_code: 'ABC456', subsidiary: subsidiary)

    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Agendar Locação'
    fill_in 'Código', with: 'ABC123'
    click_on 'Buscar'

    expect(page).to have_content("#{client.name} - #{client.document}")
  
  end

  xscenario 'busca parcial ' do
    client = Client.create!(name: 'Roberson Santos', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    rental = Rental.create!(start_date: '2019-12-23', end_date:'2019-12-32', 
      client: client, car_category: car_category,
      reservation_code: 'ABC123', subsidiary: subsidiary)

    other_rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', 
      client: client, car_category: car_category,
      reservation_code: 'ABC456', subsidiary: subsidiary)

    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Agendar Locação'
    fill_in 'Código', with: 'ABC'
    click_on 'Buscar'

    expect(page).to have_content("#{client.name} - #{client.document}")
    expect(page).to have_content("#{client.name} - #{client.document}")
 
  end

end
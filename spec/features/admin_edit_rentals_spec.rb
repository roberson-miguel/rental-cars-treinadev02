require 'rails_helper'

feature 'Admin edit rentals' do
  scenario 'successfully' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', client: client, car_category: car_category, reservation_code: 'BBB123', subsidiary: subsidiary)

    login_as(user)

    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos'
    click_on 'Editar'

    fill_in 'Data Inicial', with: '2019-12-20'
    fill_in 'Data Final', with: '2019-12-31'
    select "#{client.name} - #{client.document}", from: 'Cliente'
    select 'A', from: 'Categoria'
    select 'Scheduled', from: 'Status'
    select 'Sao Paulo', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-20')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content("#{client.name} - #{client.document}")
    expect(page).to have_content('A')
    expect(page).to have_content('Código')
    expect(page).to have_content('scheduled')
    expect(page).to have_content('Sao Paulo')
  end

end
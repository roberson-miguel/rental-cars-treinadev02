require 'rails_helper'

feature 'User edit rentals' do
  scenario 'successfully' do
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '2019-12-23', end_date:'2019-12-31', client: client, car_category: car_category)

    user = User.create(email: 'roberson@gmail.com', password:'123456789')

    login_as(user)

    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos Coccato'
    click_on 'Editar'
   
    fill_in 'Data Inicial', with: '2019-12-23'
    fill_in 'Data Final', with: '2019-12-29'
    select 'Marcos Coccato', from: 'Cliente'
    select 'A', from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-29')
    expect(page).to have_content('Marcos Coccato')
    expect(page).to have_content('A')
  end

  scenario 'must be authenticated' do
    visit new_rental_path

    expect(current_path).to eq(new_user_session_path)
  end

end
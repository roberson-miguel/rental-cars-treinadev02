require 'rails_helper'

feature 'User search rental' do

  scenario 'successfully ' do
    client = Client.create!(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin, scope: :user)
    rental = Rental.create!(start_date: '2019-12-23', end_date:'2019-12-32', 
                            client: client, car_category: car_category,
                            reservation_code: 'AAA123')
    other_rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', 
                            client: client, car_category: car_category,
                            reservation_code: 'BBB123')


    login_as(admin, scope: :user)

    visit root_path
    click_on 'Agendar Locação'
    fill_in 'Código', with: 'AAA123'
    click_on 'Buscar'

    expect(page).to have.content(rental.reservation_code)
    expect(page).not_to have.content(other_rental.reservation_code)

  end

end
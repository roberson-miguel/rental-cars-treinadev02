require 'rails_helper'

feature 'Admin delete rentals' do
  scenario 'delete rental with success' do  
    subsidiary = Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07',
                                    address: 'Rua da filial 1')
    admin = User.create!(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                         subsidiary: subsidiary)
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    client = Client.create!(name: 'Marcos Santos', document: '284.042.408-84', email: 'roberson@milguel.com')
    rental = Rental.create!(start_date: '23/12/2019', end_date:'31/12/2019', 
                            client: client, car_category: car_category, 
                            reservation_code: 'BBB123', subsidiary: subsidiary )

    login_as(admin) 
    visit root_path
    click_on 'Agendar Locação'
    click_on 'Marcos Santos'

    expect(page).to have_content('2019-12-23')
    expect(page).to have_content('2019-12-31')
    expect(page).to have_content('Marcos Santos')
    expect(page).to have_content('A')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
  end
end
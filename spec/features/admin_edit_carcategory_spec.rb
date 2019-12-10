require 'rails_helper'

feature 'Admin edit car category' do
  scenario 'successfully' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    login_as(admin)
    CarCategory.create(name: 'A')
    CarCategory.create(daily_rate: '45')
    CarCategory.create(car_insurance: '15')
    CarCategory.create(third_party_insurance: '5')                 

    visit root_path
    click_on 'Categorias Carros'
    click_on 'A'
    click_on 'Editar'

    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '45'
    fill_in 'Seguro', with: '15'
    fill_in 'Seguro de terceiros', with: '5'
    click_on 'Enviar'

    expect(page).to have_content('A')
    expect(page).to have_content('45')
    expect(page).to have_content('15')
    expect(page).to have_content('5')
  end

end
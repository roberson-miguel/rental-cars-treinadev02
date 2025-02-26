require 'rails_helper'

feature 'Admin view car category' do
  scenario 'successfully' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)
    CarCategory.create!(name: 'A', daily_rate: '45.00',
                        car_insurance: '15.00', third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'A'
    

    expect(page).to have_content('A')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
  login_as(admin)
  CarCategory.create!(name: 'A', daily_rate: '45.00',
                        car_insurance: '15.00', third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'A'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
require 'rails_helper'

feature 'Admin register car models' do
  scenario 'successfully' do

    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    Manufacturer.create!(name: 'Chevrolet')
    Manufacturer.create!(name: 'Honda')
    CarCategory.create!(name: 'A', daily_rate: '45', car_insurance: '15', third_party_insurance: '5') 
    CarCategory.create!(name: 'B', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    
    

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Registrar novo modelo de carro'
    
    fill_in 'Nome', with: 'Corsa'
    fill_in 'Ano', with: '2015'
    select 'Honda', from: 'Fabricante'
    fill_in 'Cavalos', with: '110'
    select 'A', from: 'Categoria'
    fill_in 'Combustível', with: 'Gasolina'
    click_on 'Enviar'

    expect(page).to have_content('Corsa')
    expect(page).to have_content('2015')
    expect(page).to have_content('Honda')
    expect(page).to have_content('110')
    expect(page).to have_content('A')
    expect(page).to have_content('Gasolina')
  end

end
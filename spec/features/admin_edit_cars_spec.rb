require 'rails_helper'

feature 'Admin edit cars' do
  scenario 'successfully' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Sao Paulo', cnpj:'05.372.840', address:'Rua motorizada, 456')
    Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000', car_model: car_model, subsidiary: subsidiary)

    visit root_path
    click_on 'Registrar Carros'
    click_on 'bcs-4567'
    click_on 'Editar'

    fill_in 'Placa', with: 'bxa-3765'
    fill_in 'Cor', with: 'branco'
    select 'HB20', from: 'Modelo'
    fill_in 'Quilometragem', with: '45609'
    select 'Sao Paulo', from: 'Filial'
    click_on 'Enviar'

   
    expect(page).to have_content('bxa-3765')
    expect(page).to have_content('branco')
    expect(page).to have_content('HB20')
    expect(page).to have_content('45609')
    expect(page).to have_content('Sao Paulo')
  end

end
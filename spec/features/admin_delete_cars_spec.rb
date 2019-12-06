require 'rails_helper'

feature 'Admin delete cars' do
  scenario 'delete car with success' do  

    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Sao Paulo', cnpj:'05.372.840', address:'Rua motorizada, 456')
    Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000', car_model: car_model, subsidiary: subsidiary)

    visit root_path
    click_on 'Registrar Carros'
    click_on 'bcs-4567'

    expect(page).to have_content('bcs-4567')
    expect(page).to have_content('azul')
    expect(page).to have_content('HB20')
    expect(page).to have_content('15000')
    expect(page).to have_content('Sao Paulo')
    expect(page).to have_link('Deletar')
  end
end
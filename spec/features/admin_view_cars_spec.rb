require 'rails_helper'

feature 'Admin view car' do
  scenario 'successfully' do
    
   
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Sao Paulo', cnpj:'05.372.840', address:'Rua motorizada, 456')
    car = Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000', car_model: car_model, subsidiary: subsidiary)
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    
    login_as(admin)
    visit root_path
    click_on 'Registrar Carros'
    click_on 'bcs-4567'
    
    expect(page).to have_content('HB20')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Sao Paulo', cnpj:'05.372.840', address:'Rua motorizada, 456')
    car = Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000', car_model: car_model, subsidiary: subsidiary)
    
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)

    visit root_path
    click_on 'Registrar Carros'
    click_on 'bcs-4567'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
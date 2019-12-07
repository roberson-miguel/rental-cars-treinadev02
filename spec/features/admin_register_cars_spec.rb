require 'rails_helper'

feature 'Admin register cars' do
  scenario 'successfully' do
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Sao Paulo', cnpj:'05.372.840', address:'Rua motorizada, 456')
    

    visit root_path
    click_on 'Registrar Carros'
    click_on 'Registrar novo carro'
    
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

  scenario 'and must fill in fields' do
    
    visit new_car_path

    fill_in 'Placa', with: ''
    fill_in 'Cor', with: ''
    #select '', from: 'Modelo'
    fill_in 'Quilometragem', with: ''
    #select '', from: 'Filial'
    click_on 'Enviar'
  
    expect(page).to have_content('não pode está em branco')

  end

  scenario 'and licence_plate must be unique' do
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Sao Paulo', cnpj:'05.372.840', address:'Rua motorizada, 456')
    
   
    Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000', car_model: car_model, subsidiary: subsidiary)
       
    
    visit new_car_path
    fill_in 'Placa', with: 'bcs-4567'
    fill_in 'Cor', with: 'azul'
    select 'HB20', from: 'Modelo'
    fill_in 'Quilometragem', with: '15000'
    select 'Sao Paulo', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')

  end

  scenario 'and mileage not must be less than or equal to zero' do
    
    visit new_car_path

    fill_in 'Placa', with: ''
    fill_in 'Cor', with: ''
    #select '', from: 'Modelo'
    fill_in 'Quilometragem', with: '-1'
    #select '', from: 'Filial'
    click_on 'Enviar'
  
    expect(page).to have_content('deve ser maior que zero')

  end

end
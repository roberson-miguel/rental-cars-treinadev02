require 'rails_helper'

feature 'Admin register cars' do
  scenario 'successfully' do
    
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
    #fill_in 'Cor', with: ''
    #select '', from: 'Modelo'
    #fill_in 'Quilometragem', with: ''
    #select ' ', from: 'Filial'
    click_on 'Enviar'
  
    expect(page).to have_content('Não pode está em branco')

  end

  scenario 'and licence_plate must be unique' do
    Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000')
    Car.create(licence_plate: 'yoi-2355', color: 'preto', mileage: '35000')
    CarModel.create(name: 'HB20', year: '2015', motorization:'1.0', fuel_type: 'Gasolina')
    Subsidiary.create(name: 'Sao Paulo', cnpj:'05.372.840/0001-07', address: 'Rua do Motor, 123', )
        
    visit new_car_path
    fill_in 'Placa', with: 'bcs-4567'
    fill_in 'Cor', with: 'azul'
    select 'HB20', from: 'Modelo'
    fill_in 'Quilometragem', with: '15000'
    select 'Sao Paulo', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('Placa já está em uso')
  end

end
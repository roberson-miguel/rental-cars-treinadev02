require 'rails_helper'

feature 'Admin register cars' do
  scenario 'successfully' do
    visit root_path
    click_on 'Registrar Carros'
    click_on 'Registrar novo carro'
    
    fill_in 'Placa', with: 'bxa-3765'
    fill_in 'Cor', with: 'branco'
    fill_in 'Modelo', with: 'HB20'
    fill_in 'Quilometragem', with: '45609'
    fill_in 'Filial', with: 'Sao Paulo'
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
    fill_in 'Modelo', with: ''
    fill_in 'Quilometragem', with: ''
    fill_in 'Filial', with: ''
    click_on 'Enviar'
  
    expect(page).to have_content('Não pode está em branco')

  end

  scenario 'and licence_plate must be unique' do
    Car.create!(licence_plate: 'bcs-4567', color: 'azul', CarModel: 'HB20', mileage: '15000', Subsidiary: 'Sao Paulo')
    Car.create!(licence_plate: 'yoi-2355', color: 'preto', CarModel: 'XR3', mileage: '35000', Subsidiary: 'Jaguaré')
    
    visit new_car_path
    fill_in 'Placa', with: 'bcs-4567'
    fill_in 'Cor', with: 'azul'
    fill_in 'Modelo', with: 'HB20'
    fill_in 'Quilometragem', with: '15000'
    fill_in 'Filial', with: 'Sao Paulo'
    click_on 'Enviar'

    expect(page).to have_content('Placa já está em uso')
  end

end
require 'rails_helper'

feature 'Admin delete carmodels' do
  scenario 'delete carmodel with success' do  

    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'Corsa', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    car = Car.create(licence_plate: 'bcs-4567', color: 'azul', mileage: '15000', car_model: car_model, subsidiary: subsidiary)

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Corsa'

    expect(page).to have_content('Corsa')
    expect(page).to have_content('2015')
    expect(page).to have_content('Chevrolet')
    expect(page).to have_content('1.0')
    expect(page).to have_content('A')
    expect(page).to have_content('Gasolina')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
  end
end
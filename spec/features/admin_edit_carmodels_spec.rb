require 'rails_helper'

feature 'Admin edit carmodel' do
  scenario 'successfully' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '45', car_insurance: '15', third_party_insurance: '5')                 
    car_model = CarModel.create!(name: 'Corsa', year:'2015', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    
    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Corsa'
    click_on 'Editar'
   
    fill_in 'Nome', with: 'Corsa'
    fill_in 'Ano', with: '2015'
    select 'Chevrolet', from: 'Fabricante'
    fill_in 'Cavalos', with: '1.0'
    select 'A', from: 'Categoria'
    fill_in 'Combustível', with: 'Gasolina'
    click_on 'Enviar'

    expect(page).to have_content('Corsa')
    expect(page).to have_content('2015')
    expect(page).to have_content('Chevrolet')
    expect(page).to have_content('1.0')
    expect(page).to have_content('A')
    expect(page).to have_content('Gasolina')
  end


end
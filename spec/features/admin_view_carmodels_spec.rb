require 'rails_helper'

feature 'Admin view carmodel' do
  scenario 'successfully' do
    
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)

    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'HB20'
    
    expect(page).to have_content('HB20')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do

    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)

    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
    car_model = CarModel.create!(name: 'HB20', year:'2016', motorization:'1.0', fuel_type:'Gasolina', manufacturer: manufacturer, car_category: car_category)
    
    visit root_path
    click_on 'Modelos de Carro'
    click_on 'HB20'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
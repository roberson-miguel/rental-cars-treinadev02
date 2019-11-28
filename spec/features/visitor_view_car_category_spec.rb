require 'rails_helper'

feature 'Visitor view car category' do
  scenario 'successfully' do
    CarCategory.create(name: 'Utilitários')
    CarCategory.create(daily_rate: '45.00')
    CarCategory.create(car_insurance: '15.00')
    CarCategory.create(third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'Utilitários'
    

    expect(page).to have_content('Utilitários')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    CarCategory.create(name: 'Utilitários')
    CarCategory.create(daily_rate: '45.00')
    CarCategory.create(car_insurance: '15.00')
    CarCategory.create(third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'Utilitários'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
require 'rails_helper'

feature 'Admin view car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Utilitários', daily_rate: '45.00',
                        car_insurance: '15.00', third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'Utilitários'
    

    expect(page).to have_content('Utilitários')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
  CarCategory.create!(name: 'Utilitários', daily_rate: '45.00',
                        car_insurance: '15.00', third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'Utilitários'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
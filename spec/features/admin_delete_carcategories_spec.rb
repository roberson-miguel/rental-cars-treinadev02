require 'rails_helper'

feature 'Admin delete carcategories' do
  scenario 'delete carcategory with success' do  

    CarCategory.create!(name: 'A', daily_rate: '45.00',
      car_insurance: '15.00', third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'A'

    expect(page).to have_content('A')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
  end
end
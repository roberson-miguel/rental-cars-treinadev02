require 'rails_helper'

feature 'Admin edit car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Utilitários', daily_rate: '45.00',
                        car_insurance: '15.00', third_party_insurance: '5.00')

    visit root_path
    click_on 'Categorias Carros'
    click_on 'Utilitários'
    click_on 'Editar'
    fill_in 'Nome', with: 'Utilitários'
    fill_in 'Diária', with: '45.00'
    fill_in 'Seguro', with: '15.00'
    fill_in 'Seguro de terceiros', with: '5.00'
    click_on 'Enviar'

    expect(page).to have_content('Utilitários')
    expect(page).to have_content('45.00')
    expect(page).to have_content('15.00')
    expect(page).to have_content('5.00')
  end

end
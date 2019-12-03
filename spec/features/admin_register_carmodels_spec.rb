require 'rails_helper'

feature 'Admin register car models' do
  scenario 'successfully' do
    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Registrar novo modelo de carro'
    
    fill_in 'Nome', with: 'Corsa'
    fill_in 'Ano', with: '2015'
    fill_in 'Fabricante', with: 'Hyundai'
    fill_in 'Cavalos', with: '110'
    fill_in 'Categoria', with: 'Utilitários'
    fill_in 'Combustível', with: 'Gasolina'
    click_on 'Enviar'

    expect(page).to have_content('Corsa')
    expect(page).to have_content('2015')
    expect(page).to have_content('Hyundai')
    expect(page).to have_content('110')
    expect(page).to have_content('Utilitários')
    expect(page).to have_content('Gasolina')
  end

end
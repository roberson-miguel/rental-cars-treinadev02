require 'rails_helper'

feature 'Admin register car category' do
  scenario 'successfully' do
    visit root_path
    click_on 'Categorias Carros'
    click_on 'Registrar nova Categoria de carro'
    
    fill_in 'Nome', with: 'Utilitários'
    fill_in 'Diária', with: '45'
    fill_in 'Seguro', with: '15'
    fill_in 'Seguro de terceiros', with: '5'
    click_on 'Enviar'

    expect(page).to have_content('Utilitários')
    expect(page).to have_content('45')
    expect(page).to have_content('15')
    expect(page).to have_content('5')
  end

end
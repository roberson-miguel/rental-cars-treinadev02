require 'rails_helper'

feature 'Admin delete manufacturers ' do
  scenario 'delete with success' do          
    Manufacturer.create!(name: 'Fiat')

    visit root_path
    click_on 'Fabricante'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
      
  end

end
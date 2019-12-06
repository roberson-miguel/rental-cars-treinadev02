require 'rails_helper'

feature 'Admin delete clients' do
  scenario 'delete clients with success' do  

    Client.create!(name:'Roberson Miguel', document:'284.042.408-84', email:'xxxx')

    visit root_path
    click_on 'Clientes'
    click_on 'Roberson Miguel'

    expect(page).to have_content('Roberson Miguel')
    expect(page).to have_content('284.042.408-84')
    expect(page).to have_content('xxxx')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
  end
end
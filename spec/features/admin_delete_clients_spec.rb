require 'rails_helper'

feature 'Admin delete clients' do
  scenario 'delete clients with success' do  
    subsidiary = Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07',
                       address: 'Rua da filial 1')
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    login_as(admin)

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
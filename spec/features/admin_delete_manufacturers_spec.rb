require 'rails_helper'

feature 'Admin delete manufacturers ' do
  scenario 'delete with success' do     
    subsidiary = Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07',
                       address: 'Rua da filial 1')
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    login_as(admin)     
    Manufacturer.create!(name: 'Fiat')

    visit root_path
    click_on 'Fabricante'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
      
  end

end
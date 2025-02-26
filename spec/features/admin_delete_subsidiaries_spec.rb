require 'rails_helper'

feature 'Admin delete subsidiaries ' do
  scenario 'delete with success' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    login_as(admin)
            
    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
        
    expect(page).to have_content('Sao Paulo')
    expect(page).to have_content('05.370.840/0001-07')
    expect(page).to have_content('Rua da filial 1')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
      
  end

end
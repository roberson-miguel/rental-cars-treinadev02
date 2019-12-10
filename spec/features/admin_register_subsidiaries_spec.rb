require 'rails_helper'

feature 'Admin register Subsidiaries' do
  scenario 'successfully' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)
    
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova Filial'

    fill_in 'Nome', with: 'Sao Paulo'
    fill_in 'CNPJ', with: '05.370.840/0001-07'
    fill_in 'Endereço', with: 'Rua da filial 1'
    click_on 'Enviar'
   

   
  end

  scenario 'and must fill in fields' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    login_as(admin)
    visit new_subsidiary_path
    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os campos')
  end

  scenario 'and nome e cnpj must be unique' do
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1') 
    subsidiary = Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/9999-99', address: 'Rua da filial 1')  
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin,
                        subsidiary: subsidiary)
    
    login_as(admin)
    
    visit new_subsidiary_path
    fill_in 'Nome', with: 'Sao Paulo'
    fill_in 'CNPJ', with: '05.370.840/0001-07'
    fill_in 'Endereço', with: 'Rua da filial 1'
    click_on 'Enviar'
    

    expect(page).to have_content('Nome ou CNPJ já está em uso')
  end

end
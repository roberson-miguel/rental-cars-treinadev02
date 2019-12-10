require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    subsidiary = Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07',
                                    address: 'Rua da filial 1')
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)
   
    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    

    expect(page).to have_content('Sao Paulo')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    subsidiary = Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07',
                                    address: 'Rua da filial 1')
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary: subsidiary)
    login_as(admin)

    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end


  xscenario 'if no exist subsidiary' do

    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin, subsidiary:' ')
    login_as(user)

    visit root_path
    click_on 'Filiais'
           
  
    expect(page).to have_content('Não existe filiais cadastradas')
  end
  
  


end
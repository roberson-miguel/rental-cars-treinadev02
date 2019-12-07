require 'rails_helper'

feature 'Admin view clients' do
  scenario 'successfully' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
   
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'coccato@gmail')
    
    
    visit root_path
    click_on 'Clientes'
    click_on 'Marcos Coccato'
    
    expect(page).to have_content('Marcos Coccato')
    expect(page).to have_content('284.042.408-84')
    expect(page).to have_content('coccato@gmail')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin)
    
    client = Client.create!(name: 'Marcos Coccato', document: '284.042.408-84', email: 'coccato@gmail')
    
    
    visit root_path
    click_on 'Clientes'
    click_on 'Marcos Coccato'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end

end
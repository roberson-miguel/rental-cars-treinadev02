require 'rails_helper'

feature 'Admin delete carcategories' do
  scenario 'delete carcategory with success' do  
    subsidiary = Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07',
                       address: 'Rua da filial 1')
    
    CarCategory.create!(name: 'A', daily_rate: '45.00',
                        car_insurance: '15.00', third_party_insurance: '5.00')
    
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', 
                        role: :admin, subsidiary: subsidiary)
    
    login_as(admin)

    visit root_path
    click_on 'Categorias Carros'
    click_on 'A'

    expect(page).to have_content('A')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')
  end
end
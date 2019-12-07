require 'rails_helper'

feature 'Admin delete manufacturers ' do
  scenario 'delete with success' do     
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
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
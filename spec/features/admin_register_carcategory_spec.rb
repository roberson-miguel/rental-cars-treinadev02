require 'rails_helper'

feature 'Admin register car category' do
  scenario 'successfully' do
    admin = User.create(email: 'roberson@gmail.com', password:'123456789', role: :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Categorias Carros'
    click_on 'Registrar nova Categoria de carro'
    
    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '45'
    fill_in 'Seguro', with: '15'
    fill_in 'Seguro de terceiros', with: '5'
    click_on 'Enviar'

    expect(page).to have_content('A')
    expect(page).to have_content('45')
    expect(page).to have_content('15')
    expect(page).to have_content('5')
  end

  scenario 'must be authenticated' do
    visit new_car_category_path

    expect(current_path).to eq(new_user_session_path)
  end

end
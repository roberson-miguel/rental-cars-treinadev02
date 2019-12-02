require 'rails_helper'

feature 'Admin register Subsidiaries' do
  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova Filial'

    fill_in 'Nome', with: 'Sao Paulo'
    fill_in 'CNPJ', with: '05.370.840/0001-07'
    fill_in 'Endereço', with: 'Rua da filial 1'

    click_on 'Enviar'

    expect(page).to have_content('Sao Paulo')
    expect(page).to have_content('05.370.840/0001-07')
    expect(page).to have_content('Rua da filial 1')
  end

  scenario 'and must fill in fields' do
    visit new_subsidiary_path
    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os campos')
  end

  scenario 'and nome e cnpj must be unique' do
    Subsidiary.create!(name: 'Sao Paulo',cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')
    Subsidiary.create!(name: 'Rio de Janeiro', cnpj: '05.370.840/0001-02', address: 'Rua do rio')
    
    visit new_subsidiary_path
    fill_in 'Nome', with: 'Sao Paulo'
    fill_in 'CNPJ', with: '05.370.840/0001-07'
    fill_in 'Endereço', with: 'Rua da filial 1'
    click_on 'Enviar'

    expect(page).to have_content('Nome ou CNPJ já está em uso')
  end

end
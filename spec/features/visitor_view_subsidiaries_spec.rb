require 'rails_helper'

feature 'Visitor view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create(name: 'Sao Paulo')
    Subsidiary.create(cnpj: '05.370.840/0001-07')
    Subsidiary.create(address: 'Rua da filial 1')

    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    

    expect(page).to have_content('Sao Paulo')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    Subsidiary.create(name: 'Sao Paulo')
    Subsidiary.create(cnpj: '05.370.840/0001-07')
    Subsidiary.create(address: 'Rua da filial 1')

    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
end
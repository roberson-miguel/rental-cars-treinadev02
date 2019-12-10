require 'rails_helper'

feature 'user sign in' do
  scenario 'from home page' do  
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :employed, subsidiary: subsidiary)
   
    
    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    
      within('form') do
        click_on 'Entrar'
      end
   
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Olá #{user.email}")
      expect(page).to have_link('Sair')
      
      expect(page).to have_link('Clientes')
      expect(page).to have_link('Agendar Locação')
  
      expect(page).not_to have_link('Fabricantes')
      expect(page).not_to have_link('Filiais')
      expect(page).not_to have_link('Categorias Carros')
      expect(page).not_to have_link('Modelos de Carros')
      expect(page).not_to have_link('Registrar de Carros')

  end

  scenario 'does not see Log in link' do
    
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :employed, subsidiary: subsidiary)



    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    
    within('form') do
      click_on 'Entrar'
    end
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{user.email}")
    expect(page).to have_link('Sair')
    
    expect(page).to have_link('Clientes')
    expect(page).to have_link('Agendar Locação')

    expect(page).not_to have_link('Fabricantes')
    expect(page).not_to have_link('Filiais')
    expect(page).not_to have_link('Categorias Carros')
    expect(page).not_to have_link('Modelos de Carros')
    expect(page).not_to have_link('Registrar de Carros')
  end
    
  scenario 'and log out' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    user = User.create(email: 'roberson@gmail.com', password:'123456789', role: :employed, subsidiary: subsidiary)
    
    
    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    
    within('form') do
      click_on 'Entrar'
    end
    click_on 'Sair'
            
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')
    expect(page).to have_link('Entrar')
    #expect(page).not_to have_link('Sair')
  end

  scenario 'Emploeyd login not see links' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    user = User.create(email: 'ana@gmail', password:'123123', role: :employed, subsidiary: subsidiary)
      
   
    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    
    within('form') do
      click_on 'Entrar'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{user.email}")
    expect(page).to have_link('Sair')
    
    expect(page).to have_link('Clientes')
    expect(page).to have_link('Agendar Locação')

    expect(page).not_to have_link('Fabricantes')
    expect(page).not_to have_link('Filiais')
    expect(page).not_to have_link('Categorias Carros')
    expect(page).not_to have_link('Modelos de Carros')
    expect(page).not_to have_link('Registrar de Carros')

  end

  scenario 'Admin must see all links' do
    subsidiary = Subsidiary.create!(name: 'Freguesia', cnpj:'01.450.000/0043-09', address:'Rua motorizada, 456')
    admin = User.create(email: 'ana@gmail', password:'123123', role: :admin, subsidiary: subsidiary)
    
    
    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: admin.email
    fill_in 'Senha', with: admin.password
    
    within('form') do
      click_on 'Entrar'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{admin.email}")
    expect(page).to have_link('Sair')
    
    expect(page).to have_link('Clientes')
    expect(page).to have_link('Agendar Locação')

    expect(page).to have_link('Fabricantes')
    expect(page).to have_link('Filiais')
    expect(page).to have_link('Categorias Carros')
    expect(page).to have_link('Modelos de Carros')
    expect(page).to have_link('Registrar Carros')

  end

   
end


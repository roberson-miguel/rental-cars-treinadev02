class Manufacturer < ApplicationRecord
    validates :name, presence: {message: 'Você deve informar o nome do fabricante'}
    validates :name, uniqueness: {message: 'Nome já está em uso'}
end

class Manufacturer < ApplicationRecord
    has_many :car_models
    
    validates :name, presence: {message: 'Você deve informar o nome do fabricante'}
    validates :name, uniqueness: {message: 'Nome já está em uso'}
end

class Subsidiary < ApplicationRecord
    has_many :cars
    has_many :rentals
    has_many :users

    validates :name, :cnpj, :address, presence: {message: 'Você deve informar todos os campos'}
    validates :name, :cnpj, uniqueness: {message: 'Nome ou CNPJ já está em uso'}
end

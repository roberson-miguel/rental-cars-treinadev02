class Client < ApplicationRecord
    validates :name, :document, :email, presence: {message: 'Você deve informar todos os campos'}
    validates :document, :email, uniqueness: {message: 'CPF ou Email já está em uso'}
end

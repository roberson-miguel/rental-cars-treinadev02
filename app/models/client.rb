class Client < ApplicationRecord
    has_many :rentals
    
    validates :name, :document, :email, presence: {message: 'Você deve informar todos os campos'}
    validates :document, :email, uniqueness: {message: 'CPF ou Email já está em uso'}

    def description
        "#{name} - #{document}"
    end
end

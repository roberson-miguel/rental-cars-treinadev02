class Car < ApplicationRecord
    belongs_to :car_model
    belongs_to :subsidiary
    
    validates :licence_plate, :color, :mileage, presence: {message: 'Não pode está em branco'}
    validates :licence_plate, uniqueness: {message: 'Placa já está em uso'}
    validates :mileage, inclusion: { in: 1..99999999999 }
    #validates :mileage, numericality: true
end

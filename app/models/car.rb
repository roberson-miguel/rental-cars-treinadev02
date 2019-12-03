class Car < ApplicationRecord
    validates :licence_plate, :color, :CarModel, :mileage, :Subsidiary, presence: {message: 'Não pode está em branco'}
    validates :licence_plate, uniqueness: {message: 'Placa já está em uso'}
end

class Car < ApplicationRecord
    belongs_to :car_model
    belongs_to :subsidiary
    
    has_many :car_rentals
    has_many :rentals, through: :car_rentals
    
    validates :licence_plate, :color, :mileage, presence: {message: 'não pode está em branco'}
    validates :licence_plate, uniqueness: {message: 'Placa já está em uso'}
    validates :mileage, numericality: true
    validates :mileage, numericality: {greater_than: 0, message: 'deve ser maior que zero'}

    enum status_car: [:available, :unavailable ]

end

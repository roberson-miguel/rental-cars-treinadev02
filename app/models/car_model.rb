class CarModel < ApplicationRecord
    belongs_to :manufacturer
    belongs_to :car_category
    has_many :cars
  
    validates :name, :year, :motorization, :fuel_type, presence: {message: 'Você deve informar todos os campos'}

    def information
        "#{car_model.name} - #{car.license_plate}"
    end

end

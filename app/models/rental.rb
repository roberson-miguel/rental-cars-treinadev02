class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category

  enum status_rental: [ :confirmada, :ativa, :em_andamento ] 
end

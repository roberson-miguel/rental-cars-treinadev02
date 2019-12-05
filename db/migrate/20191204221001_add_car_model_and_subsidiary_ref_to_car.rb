class AddCarModelAndSubsidiaryRefToCar < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :car_model, foreign_key: true
    add_reference :cars, :subsidiary, foreign_key: true
  end
end

class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :licence_plate
      t.string :color
      t.string :CarModel
      t.string :mileage
      t.string :Subsidiary

      t.timestamps
    end
  end
end

class CreateCarModels < ActiveRecord::Migration[5.2]
  def change
    create_table :car_models do |t|
      t.string :name
      t.string :year
      t.string :Manufacturer
      t.string :motorization
      t.string :CarCategory
      t.string :fuel_type

      t.timestamps
    end
  end
end

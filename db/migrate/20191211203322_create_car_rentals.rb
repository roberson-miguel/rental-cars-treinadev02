class CreateCarRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :car_rentals do |t|
      t.string :car
      t.string :references
      t.references :rental, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end

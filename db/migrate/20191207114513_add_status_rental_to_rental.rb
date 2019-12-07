class AddStatusRentalToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :status_rental, :integer
  end
end

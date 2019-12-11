class AddStatusCarToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :status_car, :integer, default: 0
  end
end

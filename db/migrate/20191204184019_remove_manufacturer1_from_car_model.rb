class RemoveManufacturer1FromCarModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :car_models, :Manufacturer, :string
  end
end

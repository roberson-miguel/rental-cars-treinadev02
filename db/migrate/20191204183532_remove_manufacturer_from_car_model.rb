class RemoveManufacturerFromCarModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :car_models, :manufacturer, :string
  end
end

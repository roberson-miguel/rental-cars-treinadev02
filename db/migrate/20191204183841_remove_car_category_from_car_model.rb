class RemoveCarCategoryFromCarModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :car_models, :CarCategory, :string
  end
end

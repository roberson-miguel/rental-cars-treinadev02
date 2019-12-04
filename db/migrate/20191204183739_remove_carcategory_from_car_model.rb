class RemoveCarcategoryFromCarModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :car_models, :carcategory, :string
  end
end

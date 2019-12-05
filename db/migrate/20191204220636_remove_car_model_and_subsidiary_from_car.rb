class RemoveCarModelAndSubsidiaryFromCar < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :CarModel, :string
    remove_column :cars, :Subsidiary, :string
  end
end

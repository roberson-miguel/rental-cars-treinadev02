class RemoveErro1SubsidiaryFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :subsidiary, :integer
  end
end

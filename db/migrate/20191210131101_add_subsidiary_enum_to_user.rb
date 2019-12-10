class AddSubsidiaryEnumToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subsidiary, :integer
  end
end

class RemoveErroSubsidiaryFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :subsidiary, foreign_key: true
  end
end

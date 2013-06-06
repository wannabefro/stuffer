class AddFoodToUser < ActiveRecord::Migration
  def change
    add_column :users, :food, :string
  end
end

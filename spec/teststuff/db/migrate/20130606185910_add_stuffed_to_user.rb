class AddStuffedToUser < ActiveRecord::Migration
  def change
    add_column :users, :stuffed, :boolean
  end
end

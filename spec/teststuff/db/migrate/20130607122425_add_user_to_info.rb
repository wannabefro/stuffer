class AddUserToInfo < ActiveRecord::Migration
  def change
    add_column :infos, :user_id, :integer
  end
end

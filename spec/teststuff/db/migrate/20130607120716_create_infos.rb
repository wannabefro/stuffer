class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :wage
      t.string :wife

      t.timestamps
    end
  end
end

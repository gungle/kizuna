class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.integer :group_id
      t.string :pos_title
      t.text :pos_explain
      t.float :pos_lat
      t.float :pos_lon
      t.string :picture_path

      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end

class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :user_id
      t.integer :status
      t.integer :position
      t.text :note
      t.float :now_lat
      t.float :now_lon

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end

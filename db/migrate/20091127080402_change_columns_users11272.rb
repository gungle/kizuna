class ChangeColumnsUsers11272 < ActiveRecord::Migration
  def self.up
    change_column :users, :created_at, :datetime, :null=>false 
  end

  def self.down
    change_column :users, :created_at, :datetime, :null=>true 
  end
end

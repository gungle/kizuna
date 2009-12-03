class ChangeColumnGroups < ActiveRecord::Migration
  def self.up
    change_column :groups, :created_at, :datetime, :null=>false 
  end

  def self.down
    change_column :groups, created_at, :datetime, :null=>true 
  end
end

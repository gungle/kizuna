class ChageColumnStatues20091130 < ActiveRecord::Migration
  def self.up
     change_column :statuses, :created_at, :datetime, :null=>false 
  end

  def self.down
     change_column :statuses, :created_at, :integer, :null=>true 
  end
end

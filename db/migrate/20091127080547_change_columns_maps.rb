class ChangeColumnsMaps < ActiveRecord::Migration
  def self.up
     change_column :maps, :group_id, :integer, :null=>false 
     change_column :maps, :pos_title, :string, :null=>false 
     change_column :maps, :pos_lat, :float, :null=>false 
     change_column :maps, :pos_lon, :float, :null=>false      
     change_column :maps, :created_at, :datetime, :null=>false 
  end

  def self.down
     change_column :maps, :group_id, :integer, :null=>true 
     change_column :maps, :pos_title, :string, :null=>true 
     change_column :maps, :pos_lat, :float, :null=>true 
     change_column :maps, :pos_lon, :float, :null=>true 
     change_column :maps, :created_at, :datetime, :null=>true 
  end
end

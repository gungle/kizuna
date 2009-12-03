class ChangeColumnsStatuses < ActiveRecord::Migration
  def self.up
     change_column :statuses, :user_id, :integer, :null=>false 
     change_column :statuses, :status, :integer, :null=>false 
     change_column :statuses, :position, :integer, :null=>false 
     change_column :statuses, :created_at, :integer, :null=>false 
  end

  def self.down
     change_column :statuses, :user_id, :integer, :null=>true
     change_column :statuses, :status, :integer, :null=>true 
     change_column :statuses, :position, :integer, :null=>true 
     change_column :statuses, :created_at, :integer, :null=>true 
  end
end

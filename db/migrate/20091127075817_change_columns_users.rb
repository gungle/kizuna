class ChangeColumnsUsers < ActiveRecord::Migration
  def self.up
     change_column :users, :family_id, :integer, :null=>false 
     change_column :users, :login, :string, :null=>false 
     change_column :users, :password, :string, :null=>false
     change_column :users, :full_name, :string, :null=>false 
     change_column :users, :birthday, :date, :null=>false 
     change_column :users, :blood, :integer, :null=>false 
     change_column :users, :sex, :integer, :null=>false 
     change_column :users, :mail, :string, :null=>false      
 end

  def self.down
     change_column :users, :family_id, :integer, :null=>true 
     change_column :users, :login, :string, :null=>true 
     change_column :users, :password, :string, :null=>true 
     change_column :users, :full_name, :string, :null=>true 
     change_column :users, :birthday, :datetime, :null=>true 
     change_column :users, :blood, :integer, :null=>true 
     change_column :users, :sex, :integer, :null=>true 
     change_column :users, :mail, :string, :null=>true 
  end
end

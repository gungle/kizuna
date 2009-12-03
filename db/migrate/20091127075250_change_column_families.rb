class ChangeColumnFamilies < ActiveRecord::Migration
  def self.up
    change_column :families, :group_id, :integer, :null=>false 
    change_column :families, :family_name, :string, :null=>false 
    change_column :families, :address, :string, :null=>false 
    change_column :families, :tel, :string, :null=>false 
    change_column :families, :created_at, :datetime, :null=>false 
  end

  def self.down
    change_column :families, :group_id, :integer, :null=>true 
    change_column :families, :family_name, :string, :null=>true 
    change_column :families, :address, :string, :null=>true 
    change_column :families, :tel, :string, :null=>true 
    change_column :families, :created_at, :datetime, :null=>true  
  end
end

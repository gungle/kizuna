class AddColumnGroups20100202 < ActiveRecord::Migration
  def self.up
    add_column :groups, :public_flag, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :groups, :public_flag
  end
end

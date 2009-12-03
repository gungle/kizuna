class ChangeColumnsStatuses11272 < ActiveRecord::Migration
  def self.up
     change_column :statuses, :status, :integer, :default=>0 
     change_column :statuses, :position, :integer, :default=>0 
  end

  def self.down
  end
end

class AddColumnMaps20091202 < ActiveRecord::Migration
  def self.up
    add_column :maps, :pos_kind, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :maps, :pos_kind
  end
end

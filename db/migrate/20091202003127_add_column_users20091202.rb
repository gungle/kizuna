class AddColumnUsers20091202 < ActiveRecord::Migration
  def self.up
    add_column :users, :full_name_kana, :string, :null => true
  end

  def self.down
    remove_column :users, :full_name_kana
  end
end

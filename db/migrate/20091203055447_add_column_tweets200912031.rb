class AddColumnTweets200912031 < ActiveRecord::Migration
  def self.up
    add_column :tweets, :children_cnt, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :tweets, :children_cnt
  end
end

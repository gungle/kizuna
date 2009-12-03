class ChangeColumnsTweets200912032 < ActiveRecord::Migration
  def self.up
       add_column :tweets, :group_id, :integer, :null=>false, :default=>0
  end

  def self.down
  end
end

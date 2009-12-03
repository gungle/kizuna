class ChangeColumnsTweets20091203 < ActiveRecord::Migration
  def self.up
       change_column :tweets, :parent_id, :integer, :default=>0 
end

  def self.down
  end
end

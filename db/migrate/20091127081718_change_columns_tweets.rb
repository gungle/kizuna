class ChangeColumnsTweets < ActiveRecord::Migration
  def self.up
     change_column :tweets, :parent_id, :integer, :null=>false 
     change_column :tweets, :tweet, :string, :null=>false
     change_column :tweets, :created_at, :datetime, :null=>false 
  end

  def self.down
     change_column :tweets, :parent_id, :integer, :null=>true
     change_column :tweets, :tweet, :string, :null=>true
     change_column :tweets, :created_at, :datetime, :null=>true
  end
end

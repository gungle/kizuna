class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :parent_id
      t.integer :user_id
      t.text :tweet
      t.float :tweet_lat
      t.float :tweet_lon
      t.string :picture_path

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end

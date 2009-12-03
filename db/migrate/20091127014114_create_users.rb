class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :family_id
      t.string :login
      t.string :password
      t.string :full_name
      t.datetime :birthday
      t.integer :blood
      t.integer :sex
      t.string :tel
      t.string :mail
      t.string :job
      t.text :good_field
      t.text :medical_history
      t.string :icon_path

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

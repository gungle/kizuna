class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.integer :group_id
      t.string :family_name
      t.integer :user_id
      t.string :address
      t.string :tel
      t.string :fax
      t.float :home_lat
      t.float :home_lon
      t.string :icon_path

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end

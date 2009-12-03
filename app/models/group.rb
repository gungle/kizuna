class Group < ActiveRecord::Base
  has_many :families
  has_many :maps
  has_many :tweets, :order => "updated_at DESC"
  
  validates_presence_of(:group_name)
  validates_length_of(:group_name, :maximum =>255)
end

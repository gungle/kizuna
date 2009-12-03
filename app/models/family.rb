class Family < ActiveRecord::Base
  belongs_to :group
  has_many :users
  
  validates_presence_of(:group_id, :family_name, :address, :tel)
  validates_length_of(:family_name, :maximum =>32)
  validates_length_of(:address, :maximum =>255)
  validates_length_of(:tel, :maximum =>24)
  validates_length_of(:fax, :maximum =>24)
  validates_numericality_of(:tel, :only_integer=>true)
  validates_numericality_of(:fax, :only_integer=>true)

end

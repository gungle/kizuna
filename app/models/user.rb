class User < ActiveRecord::Base
  belongs_to :family
  has_many :tweets, :order => "updated_at DESC"
  has_one :status

  validates_presence_of(:family_id, :login, :password, :full_name, :birthday, :blood, :sex, :mail)
  validates_length_of(:login, :maximum =>16)
  validates_length_of(:password, :maximum =>16)
  validates_length_of(:full_name, :maximum =>64)
  validates_length_of(:tel, :maximum =>24)
  validates_length_of(:mail, :maximum =>128)
  validates_length_of(:job, :maximum =>128)
  validates_inclusion_of(:blood, :in =>1..5)
  validates_inclusion_of(:sex, :in =>1..2)
  validates_numericality_of(:tel, :only_integer=>true)

end

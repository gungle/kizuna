class Status < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of(:user_id, :status, :position)
  validates_inclusion_of(:status, :in =>0..4) # 99も入れたい
  validates_inclusion_of(:position, :in =>0..3)

  validates_uniqueness_of(:user_id)
  
end

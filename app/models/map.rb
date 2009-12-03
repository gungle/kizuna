class Map < ActiveRecord::Base
  belongs_to :group
  
  validates_presence_of(:group_id, :pos_title, :pos_lat, :pos_lon)
  validates_length_of(:pos_title, :maximum =>256)
  validates_length_of(:pos_explain, :maximum =>512)
  
  
end

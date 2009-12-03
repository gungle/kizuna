class Tweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
#  belogns_to :parent, :class_name => "Tweet", :foreign_key => "parent_id", :counter_cache => true
#  has_many :children, :class_name => "Tweet", :foreign_key => "parent_id"
  
  validates_presence_of(:user_id, :tweet)
  validates_length_of(:tweet, :maximum =>512)
  
  def picture= (picture_field)

    if picture_field != ""
      aa = picture_field.read
      foo = File.open("/tmp/a.jpg",'w')
      foo.write aa
      foo.close
      self.picture_path = '/tmp/a.jpg'
    end

  end
    
  def base_part_of(file_name)
    name = File.basename(file_name)
    name.gsub(/[^¥w._-]/, '')
  end

end

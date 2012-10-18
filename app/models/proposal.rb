class Proposal < ActiveRecord::Base
  attr_accessible :contest_id, :designer_id, :description, :image
  
  belongs_to :designer
  belongs_to :contest
  
  has_attached_file :image

  validates :description, :length => { :minimum => 10 }
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png']
end

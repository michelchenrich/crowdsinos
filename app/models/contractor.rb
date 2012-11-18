class Contractor < User
  has_many :contests, :dependent => :destroy
end

class Designer < User
  has_many :proposals, :dependent => :destroy
  has_many :contests, :as => :winner, :through => :proposal
end

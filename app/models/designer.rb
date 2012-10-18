class Designer < User
  has_many :proposals
  has_many :contests, :as => :winner, :through => :proposal
end

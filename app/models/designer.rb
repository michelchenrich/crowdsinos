class Designer < User
  has_many :contests, :as => :winner
end

class Employee < ActiveRecord::Base
  attr_accessible :hire_date, :name

  validates :name, :presence => true
  validates :name, :length => { :in => 3..60 }
  validates :hire_date, :presence => true
end

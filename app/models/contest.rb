class Contest < ActiveRecord::Base
  attr_accessible :contractor_id, :description, :end, :name, :prize, :start, :winner_id
  
  belongs_to :contractor
  belongs_to :winner
  
  class ContestEndValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, 'must be greater than the contest''s start date' unless value > record.start
    end
  end
  
  validates :name,        :presence => true, :uniqueness => true 
  validates :description, :presence => true
  validates :contractor,  :presence => true 
  validates :start,       :presence => true 
  validates :end,         :presence => true, :contest_end => true
end

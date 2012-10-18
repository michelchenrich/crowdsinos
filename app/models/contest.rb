class Contest < ActiveRecord::Base
  attr_accessible :contractor_id, :description, :end, :name, :prize, :start, :winnining_proposal_id, :canceled
  
  belongs_to :contractor
  belongs_to :winning_proposal
  belongs_to :winner
  
  class ContestEndValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, 'must be greater than the contest''s start' unless value > record.start
    end
  end
  
  class PrizeValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if value.nil? or value < 0
        record.errors.add attribute, 'must be greater than zero'
      end
    end
  end
  
  validates :name,        :presence => true, :uniqueness => true 
  validates :description, :presence => true
  validates :contractor,  :presence => true 
  validates :start,       :presence => true 
  validates :end,         :presence => true, :contest_end => true
  validates :prize,       :presence => true, :prize => true
  
  def is_open?
    # The contest is open if the current date is between the valid period, and
    # there is no winner
    Date.current >= self.start and Date.current <= self.end and self.winner.nil?
  end
  
  def status
    if is_open?
      "Open" 
    else
      "Closed"
    end
  end
end

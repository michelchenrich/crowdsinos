class Contest < ActiveRecord::Base
  attr_accessible :contractor_id, :description, :end, :name, :prize, :start, :winnining_proposal_id, :canceled
  
  belongs_to :contractor
  has_many   :proposals,        :dependent => :destroy
  belongs_to :winning_proposal, :class_name => "Proposal"
  has_one    :winner,           :class_name => "Designer", :through => :winning_proposal, :source => :designer
  
  class ContestEndValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless record.start.nil?
        record.errors.add attribute, 'must be greater than the start date' if value.nil? or value <= record.start
      end
    end
  end
  
  class PrizeValidator < ActiveModel::EachValidator
    def numeric?(object)
      true if Float(object) rescue false
    end
    
    def validate_each(record, attribute, value)
      if value.nil? or value < 0
        record.errors.add attribute, 'must be greater than zero'
      elsif not numeric? value
        record.errors.add attribute, 'must be a number'
      end
    end
  end
  
  validates :name,        :presence => true, :uniqueness => true 
  validates :description, :length => { :minimum => 10 }
  validates :contractor,  :presence => true 
  validates :start,       :presence => true 
  validates :end,         :contest_end => true
  validates :prize,       :prize => true
  
  def is_open?
    # The contest is open if the current date is between the valid period, and
    # there is no winner
    Date.current >= self.start and Date.current <= self.end and self.winner.nil?
  end
end

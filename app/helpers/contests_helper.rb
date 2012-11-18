include ActionView::Helpers::DateHelper
include ActionView::Helpers::NumberHelper
module ContestsHelper
  def self.status_class contest
    if contest.is_open?
      if contest.end > Date.current + 1.day
        "success"
      else
        "warning"
      end
    else
      "error"
    end
  end
  
  def self.status contest
    if contest.is_open?
      if contest.end > Date.current + 1.day
        "Open" 
      else
        "Open for #{distance_of_time_in_words_to_now(contest.end, true)}"
      end
    else
      if contest.start > Date.current
        "To open in #{distance_of_time_in_words_to_now(contest.start, true)}"
      else
        "Closed"
      end
    end
  end
end

class UserSession < Authlogic::Session::Base
  #Just in case
  #http://www.logansbailey.com/2010/10/06/how-to-setup-authlogic-in-rails-3/
  
  def to_key
     new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
  
  def persisted?
    false
  end
end
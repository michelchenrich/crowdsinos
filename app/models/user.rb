class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :email, :password, :username, :password_confirmation, :type
  
  def self.inherited(child)
    child.instance_eval do
      def model_name
        User.model_name
      end
    end
    super
  end
  
  def self.select_options
    return ["Contractor", "Designer"]
  end
end

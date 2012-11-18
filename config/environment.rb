# Load the rails application
require File.expand_path('../application', __FILE__)

gem "authlogic"

gem "paperclip"

# Remove default error highlight procedure
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag
end

# Initialize the rails application
CrowdSINOS::Application.initialize!



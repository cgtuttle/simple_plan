# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SimplePlan::Application.initialize!

Time::DATE_FORMATS[:just_date] = "%m/%d/%Y"


class WorksheetsController < ApplicationController
	include ApplicationHelper
	before_filter { |c| c.set_zone "Application" }

  def index
		plan_id = current_user.profile.last_plan
		@plan = Plan.find(plan_id)
		populate
  end
	
	def populate
		
	end

end

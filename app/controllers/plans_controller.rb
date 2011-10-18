class PlansController < ApplicationController
include ApplicationHelper
before_filter	:find_plans
	
	
  def index
		@zone = "Application"	
		@account = current_account
  end
	
	def find_plans
		@plans = Plan.find(:all, :conditions => ["account_id = ? OR account_id IN (?)", current_account, current_partners])
	end

end

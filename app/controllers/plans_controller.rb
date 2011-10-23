class PlansController < ApplicationController
include ApplicationHelper
before_filter	:find_plans
	
	
  def index
		@zone = "Application"	
		@account = current_account
		@plan = Plan.new
  end
	
	def create
		@plan = Plan.new(params[:plan])
		@plan.account_id = current_account.id
		
		if @plan.save
			flash[:success] = "Successfully added a new plan"
			redirect_to plans_path
		else
			redirect_to plans_path
		end
	end
	
	def find_plans
		@plans = Plan.find(:all, :conditions => ["account_id = ? OR account_id IN (?)", current_account, current_partners])
	end

end

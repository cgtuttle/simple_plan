class Program < ActiveRecord::Base
	include ApplicationHelper
	
	belongs_to 	:seller, :class_name => "Account"
	belongs_to 	:supplier, :class_name => "Account"
	belongs_to	:account
	belongs_to	:plan
  
  has_many 		:deals
	has_many    :program_products
	has_many   	:program_categories
	has_many  	:program_activities
	
	#TODO: Remove plan_rate and plan_vol
		
	def self.ttl_budget_cost(current_partners, current_account)
		Program.sum('budget_rate * budget_vol', :conditions => [ "account_id IN (?) OR account_id = (?)", current_partners, current_account]) 
	end
	
	def budget_cost
		if self.budget_rate && self.budget_vol
			self.budget_rate * self.budget_vol
		else
			0
		end
	end
	
	def plan_volume
		if self.deals.plan_volume
			self.deals.plan_volume
		else
			0
		end
	end
	
	def plan_cost
		if self.plan_rate && self.plan_vol
			self.plan_rate * self.plan_vol
		else
			0
		end
	end
	
	def actual_volume
		if self.deals.actual_volume
			self.deals.actual_volume
		else
			0
		end
	end
	
	def actual_rate
		if self.deals.actual_rate
			self.deals.actual_rate
		else
			0
		end
	end
	
	def actual_cost
		if self.actual_rate && self.actual_volume
			self.actual_rate * self.actual_volume
		else
			0
		end
	end
	
	def act_pct_of_plan_cost
		if self.plan_cost > 0
			self.act_cost / self.plan_cost
		else
			0
		end
	end
	
	def act_pct_of_budget_cost
		if self.budget_cost > 0
			self.actual_cost / self.budget_cost
		else
			0
		end
	end
	
end

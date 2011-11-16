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
		
	def self.ttl_budget_cost(partners, account, plan)
		Program.sum('budget_rate * budget_vol', :conditions => [ "(account_id IN (?) OR account_id = (?)) AND plan_id = ?",
				partners, account, plan]) 
	end
	
	def self.plan_budget(plan)
		Plan.find(plan).budget
	end
	
	def budget_cost
		if self.budget_rate && self.budget_vol
			self.budget_rate * self.budget_vol
		else
			0
		end
	end
	
	
end

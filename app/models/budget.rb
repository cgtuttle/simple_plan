class Budget < ActiveRecord::Base
	belongs_to	:account
	has_and_belongs_to_many		:plans
	has_many :programs, :through => :plans
	has_many :deals, :through => :plans
	
	
	def plan_expense
		plans.sum( "budget_expense")
	end
	
	def program_expense
		programs.sum("budget_expense")
	end
	
	def deal_expense
		deals.sum("deal_rate * deal_volume")
	end
	
end

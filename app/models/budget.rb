class Budget < ActiveRecord::Base
	belongs_to	:account
	has_and_belongs_to_many		:plans
	has_many :programs, :through => :plans
	has_many :deals, :through => :plans
	
	
	def plan_expense
		deals.sum( "plan_rate * plan_volume")
	end
	
end

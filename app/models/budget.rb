class Budget < ActiveRecord::Base
	belongs_to	:account
	has_and_belongs_to_many		:plans
	
	
	def plan_expense
		self.plans.programs.deals.sum { |d| d.plan_rate * d.plan_volume}
	end
	
end

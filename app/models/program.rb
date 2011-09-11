class Program < ActiveRecord::Base
	
	has_many 		:deals
	belongs_to 	:seller, :class_name => "Account"
	belongs_to 	:supplier, :class_name => "Account"
	belongs_to	:account
	belongs_to 	:program_product
	belongs_to 	:program_customer
	belongs_to 	:program_category
	belongs_to	:program_activity
	
	def budget_cost
		if self.budget_rate && self.budget_vol
			self.budget_rate * self.budget_vol
		else
			0
		end
	end
	
end

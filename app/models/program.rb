class Program < ActiveRecord::Base
	
	belongs_to 	:seller, :class_name => "Account"
	belongs_to 	:supplier, :class_name => "Account"
	belongs_to	:account
  
  has_many 		:deals
	has_many    :program_products
	has_many   	:program_categories
	has_many  	:program_activities
	
	def budget_cost
		if self.budget_rate && self.budget_vol
			self.budget_rate * self.budget_vol
		else
			0
		end
	end
	
end

class Program < ActiveRecord::Base
	
	has_many 		:deals
	belongs_to 	:seller
	belongs_to 	:supplier
	belongs_to 	:program_product
	belongs_to 	:program_customer
	belongs_to 	:program_category
	belongs_to	:program_activity
	
end

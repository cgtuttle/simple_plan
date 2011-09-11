class Category < ActiveRecord::Base

	belongs_to 	:account
	belongs_to 	:category_product
	belongs_to	:program_category
	has_many		:deals
	
	
end

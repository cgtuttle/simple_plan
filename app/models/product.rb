class Product < ActiveRecord::Base
	belongs_to 	:account
	belongs_to 	:category_product
	belongs_to	:program_product
	has_many		:deals
	
end

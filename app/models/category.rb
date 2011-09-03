class Category < ActiveRecord::Base

	belongs_to 	:account
	belongs_to 	:category_product
	belongs_to	:program_categorie
	has_many		:deals
	
end

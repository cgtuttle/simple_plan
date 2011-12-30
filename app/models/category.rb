class Category < ActiveRecord::Base

	belongs_to 	:account
	belongs_to 	:category_product
	has_many :programs
	has_many :category_accounts
	has_many :approved_accounts, :through => :category_accounts
	
	
	
end

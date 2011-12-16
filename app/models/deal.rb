class Deal < ActiveRecord::Base
	belongs_to 	:program
	belongs_to 	:customer, :class_name => "Account"
  belongs_to  :category

  
	has_many		:deal_products
	
	accepts_nested_attributes_for	:deal_products
	
	#TODO:	Make customer unique
	
	DEAL_STATUS = %w[planned offered accepted rejected canceled]
	
	
end

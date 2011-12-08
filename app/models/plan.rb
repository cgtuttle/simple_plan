class Plan < ActiveRecord::Base
	belongs_to	:account
	has_many		:programs
	
	accepts_nested_attributes_for	:programs
	
	
end
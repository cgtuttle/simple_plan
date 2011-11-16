class Plan < ActiveRecord::Base
	belongs_to	:account
	has_many		:programs
	
end
class Plan < ActiveRecord::Base
	include ApplicationHelper
	belongs_to	:account
	has_many		:programs
	
	accepts_nested_attributes_for	:programs
	
	scope :released, where(:release_status => 1)
	
end
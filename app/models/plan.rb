class Plan < ActiveRecord::Base
	include ApplicationHelper
	belongs_to	:account
	has_many		:programs
	has_many		:sellers,	:through => :programs, :class_name => 'Account'

	
	accepts_nested_attributes_for	:programs
	
	scope :released, where(:release_status => 1)
	
	def rep_name(program)
		self.program.seller.name		
	end
	
end
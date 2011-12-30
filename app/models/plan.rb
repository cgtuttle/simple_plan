class Plan < ActiveRecord::Base
	include ApplicationHelper
	belongs_to	:account
	has_many		:programs
	has_many		:deals, :through => :programs
	has_many		:sellers,	:through => :programs, :class_name => 'Account', :uniq => true
	has_many		:customers, :through => :programs, :class_name => 'Account'
	
	accepts_nested_attributes_for	:programs
	
	scope :released, where(:release_status => 1)
	
	def find_sellers(page)
		self.sellers.includes(:seller_programs).order(sellers_order).page(page).per(2)
	end
	
	def find_customers
		self.customers.select("DISTINCT accounts.*").all
	end
	
	def sellers_order
		"accounts.name ASC"
	end
	
end
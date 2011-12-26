class Plan < ActiveRecord::Base
	include ApplicationHelper
	belongs_to	:account
	has_many		:programs
	has_many		:deals, :through => :programs
	has_many		:sellers,	:through => :programs, :class_name => 'Account', :uniq => true
	has_many		:customers, :through => :programs, :class_name => 'Account'
	
	accepts_nested_attributes_for	:programs
	
	scope :released, where(:release_status => 1)
	
	def find_programs
		self.programs.joins(:seller).all(:order => programs_order)
		#self.programs.select("*").joins("LEFT OUTER JOIN deals ON deals.program_id = programs.id")
	end
	
	def find_seller_programs
		Program.where(:seller_id => "self.sellers")
	end
	
	def find_sellers
		#self.sellers.select("DISTINCT accounts.*").all
		self.sellers.includes(:seller_programs).all(:order => sellers_order)
	end
	
	def find_customers
		self.customers.select("DISTINCT accounts.*").all
	end
	
	def sellers_order
		"accounts.name ASC"
	end
	
end
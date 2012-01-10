class Plan < ActiveRecord::Base
	include ApplicationHelper
	belongs_to	:account
	has_many		:programs
	has_many		:deals, :through => :programs
	has_many		:sellers,	:through => :programs, :class_name => 'Account', :uniq => true
	has_many		:customers, :through => :programs, :class_name => 'Account'
	
	accepts_nested_attributes_for	:programs
	
	scope :released, where(:release_status => 1)
	
	def find_sellers
		self.sellers.includes(:seller_programs).order(sellers_order)
	end
	
	def find_customers
		self.customers.select("DISTINCT accounts.*").all
	end
	
	def sellers_order
		"accounts.name ASC"
	end
	
	def plan_expense
		deals.sum("plan_rate * plan_volume")
	end
	
	def find_programs(sortname, sortorder)
		logger.debug "query"
		self.programs.includes(:seller, :category).order(sortname+' '+sortorder).all
	end
	
	def search_programs(sortname, sortorder, search_text, search_field)
		logger.debug "search"
		self.programs.where(search_field +" like ?", search_text).includes(:seller, :category).order(sortname+' '+sortorder).all
	end
	
end
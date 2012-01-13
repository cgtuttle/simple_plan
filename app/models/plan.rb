class Plan < ActiveRecord::Base
	include ApplicationHelper
	belongs_to	:account
	belongs_to	:seller, :class_name => "Account", :foreign_key => "seller_id"
	belongs_to	:supplier, :class_name => "Account", :foreign_key => "supplier_id"	
	has_many		:programs
	has_many		:deals, :through => :programs
	has_many		:customers, :through => :programs, :class_name => 'Account'
	has_and_belongs_to_many	:budgets
	
	accepts_nested_attributes_for	:programs
	
	scope :released, where(:release_status => 1)
	
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
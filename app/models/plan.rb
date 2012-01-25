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
	
	def program_expense
		programs.sum("budget_expense")
	end
	
	def program_volume
		programs.sum("budget_volume")
	end
	
	def deal_expense
		deals.sum("plan_rate * plan_volume")
	end
	
	def deal_volume
		deals.sum("plan_volume")
	end
	
	def deal_rate
		if deal_volume == 0
			0
		else
			deal_expense / deal_volume
		end
	end
	
	def find_programs(sortname, sortorder)
		logger.debug "query"
		self.programs.includes(:seller, :category).order(sortname+' '+sortorder).all
	end
	
	def search_programs(sortname, sortorder, search_text, search_field)
		self.programs.where(search_field +" like ?", search_text).includes(:seller, :category).order(sortname+' '+sortorder).all
	end
	
end
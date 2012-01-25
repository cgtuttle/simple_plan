class Program < ActiveRecord::Base
	include ApplicationHelper
	
	belongs_to 	:seller, :class_name => "Account", :foreign_key => "seller_id"
	belongs_to 	:supplier, :class_name => "Account", :foreign_key => "supplier_id"	
	belongs_to	:account
	belongs_to	:plan
	belongs_to	:category
  
  has_many 		:deals
	has_many		:deal_products, :through => :deals
	has_many		:deal_activities, :through => :deal_products
	has_many  	:program_activities
	has_many  	:customers, :through => :deals, :class_name => "Account"
	
	 
	accepts_nested_attributes_for :deals
		
	def self.ttl_budget_cost(partners, account, plan)
		Program.sum('budget_rate * budget_volume', :conditions => [ "(account_id IN (?) OR account_id = (?)) AND plan_id = ?",
				partners, account, plan]) 
	end
	
	def self.plan_budget(plan)
		Plan.find(plan).budget_expense
	end
	
	def find_deals
		self.deals.all(:order => deals_order)
	end
	
	def find_assigned_categories
		self.categories.where()
	end
	
	def budget_cost
		if self.budget_rate && self.budget_volume
			self.budget_rate * self.budget_volume
		else
			0
		end
	end
	
	def plan_expense
		deals.sum("plan_rate * plan_volume")
	end
	
	def deals_order
		'id'
	end
	
	
end

class Account < ActiveRecord::Base

	has_many 	:users
	has_many 	:categories
	has_many 	:products
	has_many 	:activities
	has_many  :category_accounts
	has_many  :approved_categories, :through => :category_accounts, :source => :category

	has_many	:plans
	has_many	:seller_plans, :class_name => "Plan", :foreign_key => "seller_id"
	has_many	:supplier_plans, :class_name => "Plan", :foreign_key => "supplier_id"
	has_many	:imports
	
	has_many  :deals
	has_many	:customer_deals, :class_name => "Deal", :foreign_key => "customer_id"
	
	has_many 	:programs
	has_many	:seller_programs, :class_name => "Program", :foreign_key => "seller_id"
	has_many	:supplier_programs, :class_name => "Program", :foreign_key => "supplier_id"
	has_many	:seller_deals, :through => :seller_programs, :source => :deals
	has_many  :customers, :through => :seller_deals
	
	has_many	:partnerships	
	has_many	:partners,	:through => :partnerships, :source => "partner"
	has_many	:partnerships_from, :class_name => "Partnership", :foreign_key => "partner_id"
	has_many	:partners_from,	:through => :partnerships_from,	:source => :account
	
	CAN_SIGN_UP = Rails.application.config.allow_account_sign_up
	
	SERVICE = %w[customer supplier seller]
	
	def partner_plans
		Plan.find(:all, :conditions => ["account_id = ? OR account_id IN (?)", self.id, self.partners])
	end
	
	def self.by_name
		self.all(:order => 'name ASC')
	end
	
	def sellers
		self.where(:service => 'seller').all		
	end
	
	def ordered_seller_programs
		self.seller_programs.order(programs_order)
	end
	
	def programs_order
		"start_date ASC"
	end
	

end

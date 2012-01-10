class Deal < ActiveRecord::Base
	belongs_to 	:program
	belongs_to 	:customer, :class_name => "Account"
  
	has_many		:deal_products
	
	accepts_nested_attributes_for	:deal_products
	
	#TODO:	Make customer unique
	
	DEAL_STATUS = %w[planned offered accepted rejected canceled]
	
	def find_deal_products
		self.deal_products.joins(:product).all(:order => deal_product_order)
	end
	
	def deal_product_order
		'products.code ASC'
	end
	
	def plan_expense
		(self.plan_rate ||= 0) * (self.plan_volume ||= 0)
	end
	
end

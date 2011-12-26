class DealProduct < ActiveRecord::Base
	belongs_to	:deal
  belongs_to  :product
	has_many		:deal_activities
	
	accepts_nested_attributes_for	:deal_activities
	
	def find_deal_activities
		self.deal_activities.joins(:activity).all(:order => deal_activities_order)
	end
	
	def deal_activities_order
		'activities.code'
	end
	
end

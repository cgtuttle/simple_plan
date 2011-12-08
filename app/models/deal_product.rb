class DealProduct < ActiveRecord::Base
	belongs_to	:deal
  belongs_to  :product
	has_many		:deal_activities
	
	accepts_nested_attributes_for	:deal_activities
	
	
	
end

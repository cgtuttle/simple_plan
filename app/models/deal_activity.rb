class DealActivity < ActiveRecord::Base
	belongs_to	:deal_product
	belongs_to	:activity
	
	
end

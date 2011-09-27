class Deal < ActiveRecord::Base
	belongs_to 	:program
	belongs_to 	:customer, :class_name => "Account"
  belongs_to  :category
  
	has_many		:deal_details
	
	DEAL_STATUS = %w[planned offered accepted rejected canceled]
	
	def cost
		if self.deal_rate && self.deal_vol
			self.deal_rate * self.deal_vol
		else
			0
		end
	end
end

module GlobalHelper
	
	def current_account
		current_user.account
	end
	
	def current_partners
		Account.find(:all, :conditions => ["id IN (SELECT partner_id FROM partnerships WHERE account_id = ?)", current_account])
	end
	
	def find_customers
		@customers = Account.find(:all, :conditions => {:service => 'customer', :id => current_partners})
	end
	
end
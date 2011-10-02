module GlobalHelper
	
	def GlobalHelper.current_account(user)
		user.account
	end
	
	def GlobalHelper.current_partners(user)
		Account.find(:all, :conditions => ["id IN (SELECT partner_id FROM partnerships WHERE account_id = ?)", current_account(user)])
	end
	
	def GlobalHelper.current_customers(user)
		Account.find(:all, :conditions => {:service => 'customer', :id => current_partners(user)})
	end
	
end
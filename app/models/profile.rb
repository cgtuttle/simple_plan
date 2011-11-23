class Profile < ActiveRecord::Base
	attr_accessible :name, :first_name, :last_name, :user_id
	
	belongs_to :user
	belongs_to :account
	
	def account_by_domain(submitted_domain)
		account.find_by_domain
	end
	
	def fname
		if first_name?
			first_name
		else
			username
		end
	end
	
	def lname
		if last_name?
			last_name
		end
	end
	
	def username
		if name?
			name
		else
			email
		end
	end
	
	
	
end

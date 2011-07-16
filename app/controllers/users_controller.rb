class UsersController < ApplicationController
	
	def dashboard
		@title = "#{firstname} #{lastname}"
		@zone = "Application"
		@user = current_user
	end
	
	def username
		if current_user.profile.name?
			current_user.profile.name
		else
			current_user.email
		end
	end
	
	def firstname
		if current_user.profile.first_name?
			current_user.profile.first_name
		else
			username
		end
	end
	
	def lastname
		if current_user.profile.last_name?
			current_user.profile.last_name
		end
	end

end

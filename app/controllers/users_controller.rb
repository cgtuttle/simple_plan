class UsersController < ApplicationController

		
	def dashboard
		@title = current_user.email
		@zone = "Application"
		@user = current_user
	end

end

module UsersHelper
	def username
		if @user.profile.name?
			@username = @user.profile.name
		else
			@username = @user.email
		end
	end
end

module UsersHelper

	def get_title(user)
		if(user.user_name.nil?)
			@title = user.email
		else
			@title = user.user_name
		end
	end
	
end

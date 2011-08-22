class UsersController < ApplicationController
load_and_authorize_resource
before_filter :find_account_users

	def index
		@zone = "Application"
		@user = current_user
		@profile = @user.profile
		@account = @user.account
		@title = "#{@profile.fname} #{lastname}"
	end
	
	def dashboard
		@zone = "Application"
		@user = current_user
		@profile = @user.profile
		@title = "#{@profile.fname} #{lastname}"
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
	
	def find_account_users
		@user = current_user
		@account = @user.account
		@account_users = User.where(:account_id => @account)
	end

end

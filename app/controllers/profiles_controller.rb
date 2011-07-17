class ProfilesController < ApplicationController
	
	def new
		@profile = Profile.find(params[:id])
	end
	
	def show
		@profile = Profile.find(params[:id])
		@zone = "Application"
		@title = "#{@profile.fname} #{@profile.lname}"
		@account = Account.find(@profile.account_id)
	end
	
	def index
		@zone = "Application"
	end
	
	def edit
		@profile = Profile.find(params[:id])
		@zone = "Application"
		@title = "#{@profile.fname} #{@profile.lname}"
	end
	
	def update
		@profile = Profile.find(params[:id])
		if @profile.update_attributes(params[:profile])
			flash[:success] = "Profile updated."
			redirect_to profile_path
		else
			redirect_to profile_path
		end
	end
	
end

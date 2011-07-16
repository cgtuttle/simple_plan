class ProfilesController < ApplicationController
	
	def show
		@profile = Profile.find(params[:id])
		@zone = "Application"
		@title = @profile.name
	end
	
	def index
		@zone = "Application"
	end
	
	def edit
		@profile = Profile.find(params[:id])
		@zone = "Application"
		@title = @profile.name
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

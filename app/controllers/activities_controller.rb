class ActivitiesController < ApplicationController
	
	def index
		@title = "Activities"
		@activities = Activity.all
		@activity = Activity.new
	end
	
	def show
		@activity = Activity.find(params[:id])
		@title = @activity.name
	end

  def new
		@activity = Activity.new
		@title = "New Activity"
  end
	
	def create
		@activity = Activity.new(params[:activity])
		if @activity.save
			flash[:success] = "Successfully added a new activity"
			redirect_to activities_path
		else
			redirect_to activities_path
		end
	end
	
	
end

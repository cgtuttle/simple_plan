class ActivitiesController < ApplicationController
	
	def index
		@title = "Activities"
		@activities = Activity.all
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
			redirect_to @activity
		else
			@title = "New Activity"
			render 'new'
		end
	end
	
	
end

class ActivitiesController < ApplicationController
include ApplicationHelper
before_filter	:authorize_activities
	
	def index
		@title = "Activities"
		@zone = "Application"
		@activity = Activity.new
	end
	
	def show
		@zone = "Application"
		@activity = Activity.find(params[:id])
		@title = @activity.name
	end

  def new
		redirect_to activities_path
  end
	
	def edit
		@zone = "Application"
		@activity = Activity.find(params[:id])
		@title = @activity.name
	end
	
	def update
		@activity = Activity.find(params[:id])
		if @activity.update_attributes(params[:activity])
			flash[:success] = "Activity updated."
			redirect_to activities_path
		else
			redirect_to activities_path
		end
	end
	
	def create
		@activity = Activity.new(params[:activity])
		@activity.account_id = current_account
		if @activity.save!
			flash[:success] = "Successfully added a new activity"
			redirect_to activities_path
		else
			flash[:error] = "Unable to create new activity"
			redirect_to activities_path
		end
	end
	
	def destroy
    Activity.find(params[:id]).destroy
    flash[:success] = "Activity deleted."
    redirect_to activities_path
  end	
	
	def authorize_activities
		@activities = Activity.find(:all, :conditions => [ "account_id IN (?) OR account_id = (?)", current_partners, current_account])
	end
	
end

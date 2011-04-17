class ActivitiesController < ApplicationController

	def show
		@activity = Activity.find(params[:id])
	end

  def new
		@title = "New Activity"
  end

end

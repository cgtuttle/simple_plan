class ActivitiesController < ApplicationController
	
	def index
		activities = Activity.find(:all) do
			if params[:_search] == "true"
				name =~ "%#{params[:name]}%" if params[:name].present?
			end
			paginate :page => params[:page], :per_page => params[:rows]
			order_by "#{params[:sidx]} #{params[:sord]}"
		end
		
		respond_to do |format|
			format.html
			format.json { render :json => activities.to_jqgrid_json([:name], 
                          params[:page], params[:rows], activities.total_entries) }	
		end
	end
	
	def show
		@activity = Activity.find(params[:id])
		@title = @activity.name
	end

  def new
		redirect_to activities_path
  end
	
	def edit
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
		if @activity.save
			flash[:success] = "Successfully added a new activity"
			redirect_to activities_path
		else
			redirect_to activities_path
		end
	end
	
	def destroy
    Activity.find(params[:id]).destroy
    flash[:success] = "Actvity deleted."
    redirect_to activities_path
  end	
	
end

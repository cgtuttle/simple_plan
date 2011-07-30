class PartnershipsController < ApplicationController
	load_and_authorize_resource
	
	def new
		redirect_to partnerships_path
	end
	
	def create
		if @partnership.save
			flash[:success] = "Successfully added a new partnership"
			redirect_to partnerships_path
		else
			redirect_to partnerships_path
		end
	end
	
	def edit
		@zone = "Application"
		@title = @partnership.name
	end
	
	def index
		@title = "Partners"
		@zone = "Application"
		@partnerships = Partnership.all
		@partnership = Partnership.new
	end
	
	def destroy
		Partnership.find(params[:id]).destroy
    flash[:success] = "Partnership deleted."
    redirect_to partnerships_path
	end
	
	def show
		@zone = "Application"
		@title = @partnership.name
		@name = @title
	end
	
	def update
		if @partnership.update_attributes(params[:partnership])
			flash[:success] = "partnership updated."
			redirect_to partnerships_path
		else
			redirect_to partnerships_path
		end
	end
	
end

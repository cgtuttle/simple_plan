class PartnershipsController < ApplicationController
include ApplicationHelper

	def new
		redirect_to partnerships_path
	end
	
	def create
		@partnership = Partnership.new(params[:partnership])
		@partnership.account_id = current_account
		if @partnership.save
			flash[:success] = "Successfully added a new partner"
			redirect_to partnerships_path
		else
			flash[:error] = "Unable to add partner"
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
		@account = current_account
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

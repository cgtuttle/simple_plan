class ServicesController < ApplicationController
	def index
		@title = "Services"
		@zone = "Application"		
		@services = Service.all
		@service = Service.new
	end
	
	def show
		@zone = "Application"
		@service = Service.find(params[:id])
		@title = @service.name
	end

  def new
		redirect_to services_path
  end
	
	def edit
		@zone = "Application"
		@service = Service.find(params[:id])
		@title = @service.name
	end
	
	def update
		@service = Service.find(params[:id])
		if @service.update_attributes(params[:service])
			flash[:success] = "service updated."
			redirect_to services_path
		else
			redirect_to services_path
		end
	end
	
	def create
		@service = Service.new(params[:service])
		if @service.save
			flash[:success] = "Successfully added a new service"
			redirect_to services_path
		else
			redirect_to services_path
		end
	end
	
	def destroy
    Service.find(params[:id]).destroy
    flash[:success] = "service deleted."
    redirect_to services_path
  end	



end

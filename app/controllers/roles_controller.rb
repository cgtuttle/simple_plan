class RolesController < ApplicationController

def index
		@title = "Roles"
		@zone = "Application"		
		@roles = Role.all
		@role = Role.new
	end
	
	def show
		@zone = "Application"
		@role = Role.find(params[:id])
		@title = @role.name
	end

  def new
		redirect_to roles_path
  end
	
	def edit
		@zone = "Application"
		@role = Role.find(params[:id])
		@title = @role.name
	end
	
	def update
		@role = Role.find(params[:id])
		if @role.update_attributes(params[:role])
			flash[:success] = "Role updated."
			redirect_to roles_path
		else
			redirect_to roles_path
		end
	end
	
	def create
		@role = Role.new(params[:role])
		if @role.save
			flash[:success] = "Successfully added a new role"
			redirect_to roles_path
		else
			redirect_to roles_path
		end
	end
	
	def destroy
    Role.find(params[:id]).destroy
    flash[:success] = "Role deleted."
    redirect_to roles_path
  end	
end

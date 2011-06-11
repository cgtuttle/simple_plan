class UserRolesController < ApplicationController

def index
		@title = "User roles"
		@zone = "Application"		
		@user_roles = User_role.all
		@user_role = User_role.new
	end
	
	def show
		@zone = "Application"
		@user_role = User_role.find(params[:id])
		@title = @user_role.user.name + " | " + @user_role.role.name
	end

  def new
		redirect_to user_roles_path
  end
	
	def edit
		@zone = "Application"
		@user_role = User_role.find(params[:id])
		@title = @user_role.user.name + " | " + @user_role.role.name
	end
	
	def update
		@user_role = User_role.find(params[:id])
		if @user_role.update_attributes(params[:user_role])
			flash[:success] = "user role updated."
			redirect_to user_roles_path
		else
			redirect_to user_roles_path
		end
	end
	
	def create
		@user_role = User_role.new(params[:user_role])
		if @user_role.save
			flash[:success] = "Successfully added a new user role"
			redirect_to user_roles_path
		else
			redirect_to user_roles_path
		end
	end
	
	def destroy
    User_role.find(params[:id]).destroy
    flash[:success] = "user role deleted."
    redirect_to user_roles_path
  end	
end

class GroupsController < ApplicationController
	def index
		@title = "Groups"
		@zone = "Application"		
		@groups = Group.all
		@group = Group.new
	end
	
	def show
		@zone = "Application"
		@group = Group.find(params[:id])
		@title = @group.name
	end

  def new
		redirect_to groups_path
  end
	
	def edit
		@zone = "Application"
		@group = Group.find(params[:id])
		@title = @group.name
	end
	
	def update
		@group = Group.find(params[:id])
		if @group.update_attributes(params[:group])
			flash[:success] = "group updated."
			redirect_to groups_path
		else
			redirect_to groups_path
		end
	end
	
	def create
		@group = Group.new(params[:group])
		if @group.save
			flash[:success] = "Successfully added a new group"
			redirect_to groups_path
		else
			redirect_to groups_path
		end
	end
	
	def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "group deleted."
    redirect_to groups_path
  end	



end

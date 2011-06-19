class AccountGroupsController < ApplicationController

def index
		@title = "Account groups"
		@zone = "Application"		
		@account_groups = Account_group.all
		@account_group = Account_group.new
	end
	
	def show
		@zone = "Application"
		@account_group = Account_group.find(params[:id])
		@title = @account_group.name
		@name = @title
	end

  def new
		redirect_to account_groups_path
  end
	
	def edit
		@zone = "Application"
		@account_group = Account_group.find(params[:id])
		@title = @account_group.name
	end
	
	def update
		@account_group = Account_group.find(params[:id])
		if @account_group.update_attributes(params[:account_group])
			flash[:success] = "Account group updated."
			redirect_to account_groups_path
		else
			redirect_to account_groups_path
		end
	end
	
	def create
		@account_group = Account_group.new(params[:account_group])
		if @account_group.save
			flash[:success] = "Successfully added a new account group"
			redirect_to account_groups_path
		else
			redirect_to account_groups_path
		end
	end
	
	def destroy
    Account_group.find(params[:id]).destroy
    flash[:success] = "Account group deleted."
    redirect_to account_groups_path
  end	


end

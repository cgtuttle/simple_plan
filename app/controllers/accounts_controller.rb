class AccountsController < ApplicationController

	def index
		@title = "Accounts"
		@zone = "Application"		
		@accounts = Account.all
		@account = Account.new
	end
	
	def show
		@zone = "Application"
		@account = Account.find(params[:id])
		@title = @account.name
		@name = @title
	end

  def new
		redirect_to accounts_path
  end
	
	def edit
		@zone = "Application"
		@account = Account.find(params[:id])
		@title = @account.name
	end
	
	def update
		@account = Account.find(params[:id])
		if @account.update_attributes(params[:account])
			flash[:success] = "Account updated."
			redirect_to accounts_path
		else
			redirect_to accounts_path
		end
	end
	
	def create
		@account = Account.new(params[:account])
		if @account.save
			flash[:success] = "Successfully added a new account"
			redirect_to accounts_path
		else
			redirect_to accounts_path
		end
	end
	
	def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Account deleted."
    redirect_to accounts_path
  end	

end

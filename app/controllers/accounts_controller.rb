class AccountsController < ApplicationController
	load_and_authorize_resource
	before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html
	
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
		
	def find_user_account
  	@current_user = current_user
		@current_profile = @current_user.profile
		@user_name = @current_user.email
		@user_account_id = @current_user.account_id
	end
	
 
end

class UsersController < ApplicationController
	include UsersHelper
 
	def show
		@user = User.find(params[:id])
		@zone = "Application"
		get_title @user
	end
	
	def edit
		@zone = "Application"
		@user = User.find(params[:id])
		get_title @user
	end
	
	def new
		@zone = "Sign in"
		@user = User.new
		get_title @user
  end
	
	def create
    @user = User.new(params[:user])
    if @user.save
			sign_in @user
			flash[:success] = "Welcome to SimplePlan!"
      redirect_to @user
    else
			@zone = "Sign in"
      @title = "Sign up"
			@user.password = ""
			@user.password_confirmation = ""
      render 'new'
    end
  end
	
end

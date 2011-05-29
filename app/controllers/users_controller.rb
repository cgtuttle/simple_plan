class UsersController < ApplicationController
 
	def show
		@user = User.find(params[:id])
		@title = @user.user_name
		@zone = "Application"
	end
	
	def new
		@zone = "Sign in"
		@user = User.new
		@title = "Sign up"		
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

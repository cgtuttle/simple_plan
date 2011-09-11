class CategoriesController < ApplicationController
include ApplicationHelper
before_filter	:authorize_categories

  def index
		@title = "Categories"
		@zone = "Application"	
		@category = Category.new
	end
	
	def show
		@zone = "Application"
		@category = Category.find(params[:id])
		@title = @category.name
	end

  def new
		redirect_to categories_path
  end
	
	def edit
		@zone = "Application"
		@category = Category.find(params[:id])
		@title = @category.name
	end
	
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			flash[:success] = "Category updated."
			redirect_to categories_path
		else
			redirect_to categories_path
		end
	end
	
	def create
		@category = Category.new(params[:category])
		@category.account_id = current_account.id
		if @category.save
			flash[:success] = "Successfully added a new category"
			redirect_to categories_path
		else
			redirect_to categories_path
		end
	end
	
	def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted."
    redirect_to categories_path
  end	
	
	def authorize_categories
		@categories = Category.find(:all, :conditions => [ "account_id IN (?) OR account_id = (?)", current_partners, current_account])
	end
	
end

class ProductsController < ApplicationController
include ApplicationHelper
require 'csv'
before_filter	:authorize_products
before_filter { |c| c.set_zone "Application" }

  def index
		@title = "Products"
		@product = Product.new
	end
	
	def show
		@product = Product.find(params[:id])
		@title = @product.name
	end

  def new
		redirect_to products_path
  end
	
	def edit
		@product = Product.find(params[:id])
		@title = @product.name
	end
	
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			flash[:success] = "Product updated."
			redirect_to products_path
		else
			redirect_to products_path
		end
	end
	
	def create
		@product = Product.new(params[:product])
		@product.account_id = current_account.id
		if @product.save
			flash[:success] = "Successfully added a new product"
			redirect_to products_path
		else
			redirect_to products_path
		end
	end
	
	def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted."
    redirect_to products_path
  end
	
	def authorize_products
		@products = Product.find(:all, :conditions => [ "account_id IN (?) OR account_id = (?)", current_partners, current_account])
	end
	
end

class ProductsController < ApplicationController
include ApplicationHelper
require 'csv'
before_filter	:authorize_products

  def index
		@title = "Products"
		@zone = "Application"	
		@product = Product.new
	end
	
	def show
		@zone = "Application"
		@product = Product.find(params[:id])
		@title = @product.name
	end

  def new
		redirect_to products_path
  end
	
	def edit
		@zone = "Application"
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
	
	def csv_import
		row_count = 0
		@parsed_file=CSV::Reader.parse(params[:dump][:file])
 		@parsed_file.each do |row|
			col = 2
			pr = Product.new(
					:code => row[0],
					:name => row[1],
					:account_id => current_account.id
			)
			if pr.save
				flash[:success] = "Import was successful."
			else
				flash[:error] = "Unsuccessful import"
			end
			redirect_to products_path
		end
	end
	
	def authorize_products
		@products = Product.find(:all, :conditions => [ "account_id IN (?) OR account_id = (?)", current_partners, current_account])
	end
	
end

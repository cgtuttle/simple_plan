class DealProductsController < ApplicationController
include ApplicationHelper
before_filter :find_deal
before_filter	:find_program
before_filter	:find_customer
before_filter :find_deal_products
before_filter	:find_products

  def create
		@deal_product = @deal.deal_products.build(params[:deal_product])
		if @deal_product.save
			flash[:success] = "Successfully added deal product"
			redirect_to deal_deal_products_path
		else
			flash[:error] = "Could not add new product"
			redirect_to programs_path
		end
	end
	
	def index
		@title = "Deal Products"
		@zone = "Application"
  end
	
	def edit
		@zone = "Application"
		@title = @deals.product.name
  end
	
  def show
		@zone = "Application"
		@deal = Deal.find(params[:deal_id])
		@title = @deal.code
  end
	
	def find_deal
		@deal = Deal.find(params[:deal_id])
	end
	
	def find_program
		@program = @deal.program
	end
	
	def find_customer
		@customer = Account.find(:first, :conditions => ["id = ?", @deal.customer_id])
		logger.debug "The object is #{@customer}"
	end
  
  def find_deal_products
    @deal_products = @deal.deal_products
  end
	
	def find_products
		@products = Product.find(:all, :conditions => ["id NOT IN (SELECT product_id FROM deal_products WHERE deal_id = ?)
				AND (account_id IN (?) OR account_id = ?)", @deal.id, current_partners, current_account])
	end
	
end

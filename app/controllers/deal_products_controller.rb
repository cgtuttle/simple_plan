class DealProductsController < ApplicationController
include ApplicationHelper
before_filter :find_deal
before_filter	:find_program
before_filter	:find_customer
before_filter :find_deal_products

  def create
		@deal_detail = @program.deal.deal_products.build(params[:deal])
		if @deal_detail.save
			flash[:success] = "Successfully added deal details"
			redirect_to program_deal_products_path
		else
			flash[:error] = "Could not add new details"
			redirect_to programs_path
		end
	end
	
	def index
		@title = "Deal Details"
		@zone = "Application"
  end
	
	def edit
		@zone = "Application"
		@title = @deals.detail.name
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
	
	
end

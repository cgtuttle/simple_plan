class DealActivitiesController < ApplicationController
	include ApplicationHelper
	before_filter	:find_deal_product
	before_filter	:find_deal
	before_filter	:find_program
	before_filter	:find_deal_activities
	before_filter	:find_customer
	before_filter	:find_product
	before_filter :find_activities
	
  def create
		@deal_activity = @deal_product.deal_activities.build(params[:deal_activity])
		if @deal_activity.save
			flash[:success] = "Successfully added deal activity"
			redirect_to deal_product_deal_activities_path
		else
			flash[:error] = "Could not add new activity"
			redirect_to deal_product_deal_activites_path
		end
	end
	
	def index
		@title = "Deal Activities"
		@zone = "Application"
  end

  def show
  end

  def edit
	end
	
	def find_deal
		@deal = Deal.find(params[:deal_id])
	end
	
	def find_program
		@program = @deal.program
	end
	
  def find_deal_product
    @deal_product = DealProduct.find(params[:deal_product_id])
  end
	
	def find_deal
		@deal = @deal_product.deal
	end
	
	def find_program
		@program = @deal.program
	end
	
	def find_deal_activities
		@deal_activities = @deal_product.deal_activities
	end
	
	def find_customer
		@customer = Account.find(:first, :conditions => ["id = ?", @deal.customer_id])
		logger.debug "The object is #{@customer}"
	end
	
	def find_product
		@product = Product.find(:first, :conditions => ["id = ?", @deal_product.product_id])
	end
	
	def find_activities
		@activities = Activity.find(:all, :conditions => ["id NOT IN (SELECT activity_id FROM deal_activities WHERE deal_product_id = ?)
				AND (account_id IN (?) OR account_id = ?)", @deal_product.id, current_partners, current_account])
	end

end

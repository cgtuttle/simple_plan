class DealsController < ApplicationController
include ApplicationHelper
before_filter	:find_program
before_filter :find_deals
before_filter	:find_customers
before_filter :find_plan

  def create
		@deal = @program.deals.build(params[:deal])
		@deal.owner_id = current_user.id
		if @deal.save
			flash[:success] = "Successfully added a new deal"
			redirect_to program_deals_path
		else
			flash[:error] = "Could not add a new deal"
			redirect_to programs_path
		end
	end
	
	def index
		@title = "Deals"
		@zone = "Application"
  end
	
	def edit
		@zone = "Application"
		@deal = Deal.find(params[:id])
		@customer = Account.find(@deal.customer_id)
		@title = @deal.customer.name
  end
	
  def show
		@zone = "Application"
		@deal = Deal.find(params[:id])
		@title = @deal.name
  end
	
	def destroy
		Deal.find(params[:id]).destroy
    flash[:success] = "Deal deleted."
    redirect_to program_deals_path
	end
	
	def update
		@deal = @program.deals.find(params[:id])
		if params[:commit] == "Update"
			if @deal.update_attributes(params[:deal])
				flash[:success] = "Deal updated."
				redirect_to program_deals_path
			else
				redirect_to program_deals_path
			end
		elsif params[:commit] == "Cancel"
			redirect_to program_deals_path
		end
	end
	
	def find_program
		@program = Program.find(params[:program_id])
	end
	
	def find_deals
		@deals = @program.deals
	end
	
	def find_customers
		#@customers = Account.find(:all, :conditions => {:service => 'customer', :id => current_partners})
		@customers = Account.find(:all, :conditions => ["id NOT IN (SELECT customer_id FROM deals WHERE program_id = ?)
				AND service = ? AND id IN (?)", @program.id, "customer", current_partners])
	end
	
	def find_plan
		@plan = @program.plan
	end
	
end
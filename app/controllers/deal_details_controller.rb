class DealDetailsController < ApplicationController
include ApplicationHelper
before_filter	:find_program
before_filter :find_deal
before_filter :find_deal_details

  def create
		@deal_detail = @program.deal.deal_details.build(params[:deal])
		if @deal_detail.save
			flash[:success] = "Successfully added deal details"
			redirect_to program_deal_details_path
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
		@deal = Deal.find(params[:id])
		@title = @deal.code
  end
	
	def find_program
		@program = Program.find(params[:program_id])
	end
	
	def find_deal
		@deal = @program.deal.find(params[:deal_id])
	end
  
  def find_deal_details
    @deal_details = @deal.deal_details
  end
  
  
	
end

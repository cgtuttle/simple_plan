class BudgetsController < ApplicationController
	include ApplicationHelper
	before_filter { |c| c.set_zone "Application" }
	
  def index
		@account = current_account
		@budgets = Budget.where(:account_id => @account).all
		@budget = Budget.new
  end
	
	def edit
		@account = current_account
		@budget = Budget.find(params[:id])
		@plans = Plan.where("account_id = ? OR seller_id = ? OR supplier_id = ?", @account, @account, @account).all
	end
	
	def update
		if params[:submit] == "Update"
			params[:budget][:plan_ids] ||= []
			@budget = Budget.find(params[:id])
			if @budget.update_attributes(params[:budget])
				flash[:success] = "Budget updated"
			else
				flash[:error] = "Budget update failed"
			end
		end
		redirect_to budgets_path
	end
	
	def create
		@budget = Budget.new(params[:budget])
		@budget.account_id = current_account.id
		if @budget.save
			flash[:success] = "Successfully added a new budget"
			redirect_to budgets_path
		else
			redirect_to budgets_path
		end
	end

end

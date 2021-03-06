class PlansController < ApplicationController
include ApplicationHelper

before_filter :find_budget
before_filter	:validate_plan
before_filter { |c| c.set_zone "Application" }


	
  def index
		@plans = find_plans
		@account = current_account
		@plan = Plan.new
		@suppliers = Account.find(:all, :conditions => {:service => 'supplier', :id => current_partners})
		@sellers = Account.find(:all, :conditions => {:service => 'seller', :id => current_partners})
  end
	
	def create
		@plan = Plan.new(params[:plan])
		@plan.account_id = current_account.id
		current_account.service == 'supplier' ? @plan.supplier_id = current_account.id : @plan.seller_id = current_account.id		
		if @plan.save
			@plan.budgets << @budget
			flash[:success] = "Successfully added a new plan to the budget"
			redirect_to budget_plans_path(@budget)
		else
			redirect_to budget_plans_path(@budget)
		end
	end
	
	def edit
		@plan = Plan.find(params[:id])		
		@account = current_account
		@budgets = Budget.where(:account_id => @account.id).all	
	end
	
	def update
		if params[:submit] == "Update"
			params[:plan][:budget_ids] ||= []
			@plan = Plan.find(params[:id])
			if @plan.update_attributes(params[:plan])
				flash[:success] = "Plan updated."
			else
				flash[:error] = "Plan did not update properly"
			end
		end
		redirect_to plans_path
	end
	
	def validate_plan
		if !params[:id]
			plan_id = current_user.profile.last_plan
		else
			plan_id = params[:id]
		end
		@plan = Plan.find(plan_id)
		if current_account.partner_plans.include?(@plan) # Avoid manually entered url like "/plans/4/edit"
			current_user.profile.set_last_plan(@plan.id)
		else
			flash[:error]='This plan is not available'
			redirect_to plans_path
		end
	end
	
	def find_plans
		if @budget
			@plans = @budget.plans
		else
			@plans = Plan.where("account_id = ? OR account_id IN (?)", current_account, current_partners)
		end		
	end
	
	def find_budget
		if params[:budget_id]
			@budget = Budget.find(params[:budget_id])
		end
	end
	
end

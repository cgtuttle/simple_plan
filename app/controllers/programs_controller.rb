class ProgramsController < ApplicationController
include ApplicationHelper
before_filter { |c| c.set_zone "Application" }
before_filter	:validate_plan

  def index
		@title = "#{current_account.name} Programs"
		@program = @plan.programs.new
		@ttl_budget_cost = Program.ttl_budget_cost(current_partners, current_account, @plan)
		@plan_budget = Program.plan_budget(@plan)
		@service_needed = service_needed
		@suppliers = Account.find(:all, :conditions => {:service => 'supplier', :id => current_partners})
		@sellers = Account.find(:all, :conditions => {:service => 'seller', :id => current_partners})
	end
	
	def worksheet
		@title = "#{current_account.name} Worksheet"
		@program = @plan.programs.new
		@program.account_id = current_account
	end
	
	def test
		@programs = Program.find(:all)
	end
	
	def show
		@program = Program.find(params[:id])
		@title = @program.name
	end

	def edit
		@program = Program.find(params[:id])
		@title = @program.name
	end
	
	def update
		@program = Program.find(params[:id])
		if @program.update_attributes(params[:program])
			flash[:success] = "Program updated."
			redirect_to programs_path
		else
			redirect_to programs_path
		end
	end
	
	def create
		@program = @plan.programs.build(params[:program])
		@program.account_id = current_account.id
		@program.plan_id = @plan.id
		if current_account.service == 'supplier'
			@program.supplier = current_account
		else
			@program.seller = current_account
		end
		
		if @program.save
			flash[:success] = "Successfully added a new program"
			redirect_to plan_programs_path
		else
			redirect_to plan_programs_path
		end
	end
	
	def destroy
    Program.find(params[:id]).destroy
    flash[:success] = "Program deleted."
    redirect_to programs_path
  end
	
	def validate_plan
		if !params[:plan_id]
			plan_id = current_user.profile.last_plan
		else
			plan_id = params[:plan_id]
		end
		@plan = Plan.find(plan_id)
		if current_account.partner_plans.include?(@plan)
			current_user.profile.set_last_plan(@plan.id)
		else
			flash[:error]='This plan is not available'
			redirect_to plans_path
		end
	end
	
	def service_needed
		case current_account.service
		when 'supplier'
			'seller'
		when 'seller'
			'supplier'
		end
	end	
	
end

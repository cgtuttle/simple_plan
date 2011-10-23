class ProgramsController < ApplicationController
include ApplicationHelper
before_filter	:find_plan
before_filter	:find_programs
before_filter :find_account
before_filter	:find_customers

  def index
		@title = "#{@account.name} Programs"
		@zone = "Application"	
		@program = @plan.programs.new
		@ttl_budget_cost = Program.ttl_budget_cost(current_partners, current_account, @plan)
		@plan_budget = Program.plan_budget(@plan)
		@service_needed = service_needed
		@suppliers = Account.find(:all, :conditions => {:service => 'supplier', :id => current_partners})
		@sellers = Account.find(:all, :conditions => {:service => 'seller', :id => current_partners})
	end
	
	def show
		@zone = "Application"
		@program = Program.find(params[:id])
		@title = @program.name
	end

  def new
		redirect_to programs_path
  end
	
	def edit
		@zone = "Application"
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

	def find_programs
		@programs = @plan.programs.find(:all, :conditions => [ "(account_id IN (?) OR account_id = (?))", 
				current_partners, current_account])
	end
	
	def find_account
		@account = GlobalHelper::current_account(current_user)
	end
	
	def find_customers
		@customers = GlobalHelper::current_customers(current_user)
	end
	
	def find_plan
		@plan = Plan.find(params[:plan_id])
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

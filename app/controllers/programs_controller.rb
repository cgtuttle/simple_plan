class ProgramsController < ApplicationController
include ApplicationHelper
before_filter { |c| c.set_zone "Application" }
before_filter	:validate_plan

  def index
		@title = "#{current_account.name} Programs"
		@program = @plan.programs.new
		@programs = @plan.programs.includes(:account, :category, :supplier, :seller)
		@categories = current_account.approved_categories.all
		@ttl_budget_cost = Program.ttl_budget_cost(current_partners, current_account, @plan)
		@plan_budget = Program.plan_budget(@plan)
		@service_needed = service_needed
		@suppliers = Account.find(:all, :conditions => {:service => 'supplier', :id => current_partners})
		@sellers = Account.find(:all, :conditions => {:service => 'seller', :id => current_partners})
	end
	
	def list
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

	def grid_data
		page = (params[:page]).to_i
    rp = (params[:rp]).to_i
    query = params[:query]
    qtype = params[:qtype]
    sortname = params[:sortname]
    sortorder = params[:sortorder]

    if (!sortname)
      sortname = "name"
    end

    if (!sortorder)
      sortorder = "asc"
    end

    if (!page)
      page = 1
    end

    if (!rp)
      rp = 10
    end

    start = ((page-1) * rp).to_i
    query = "%"+query+"%"

    # No search terms provided
    if(query == "%%")
      @programs = @plan.programs.find(:all,
		:include => :seller,
  	:order => sortname+' '+sortorder,
  	:limit =>rp,
  	:offset =>start
  	)
      count = @plan.programs.count(:all)
    end
		
		 # User provided search terms
    if(query != "%%")
        @programs = @plan.programs.find(:all,
		:include => :seller,
	  :order => sortname+' '+sortorder,
	  :limit =>rp,
  	  :offset =>start,
  	  :conditions=>[qtype +" like ?", query])
			count = @plan.programs.count(:all,
	  :conditions=>[qtype +" like ?", query])
    end
	
		return_data = Hash.new
		return_data[:page] = page
    return_data[:total] = count
		
		return_data[:rows] = @programs.collect{|p| {
  			   :cell => [
						 p.id,
						 p.code,
						 p.seller.name,
						 p.start_date ? p.start_date.strftime("%m/%d/%Y") : nil,
						 p.end_date ? p.end_date.strftime("%m/%d/%Y") : nil
						 
					 ]}}
		 
    # Convert the hash to a json object
    render :text=>return_data.to_json, :layout=>false
	end
end

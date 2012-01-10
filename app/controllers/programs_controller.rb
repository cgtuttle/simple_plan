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
		current_account.service == 'supplier' ? 'seller' : 'supplier'
	end

	def grid_data
		page = (params[:page]).to_i
    rp = (params[:rp]).to_i
    query = params[:query]
    qtype = params[:qtype]
    sortname = params[:sortname]
    sortorder = params[:sortorder]
		
		case sortname
		when 'seller.name'
			sortname = 'accounts.name'
		when 'category.code'
			sortname = 'categories.code'
		end
				
		# Defaults		
		sortname ||= "program.id"
		sortorder ||= "asc"
		page ||= 1
		rp ||= 10
  
    start = ((page-1) * rp).to_i
		finish = start + rp - 1
    query = "%"+query+"%"

    # No search terms provided
    if(query == "%%")
			@programs = @plan.find_programs(sortname, sortorder)			
		else		
		 # User provided search terms
			@programs = @plan.search_programs(sortname, sortorder, query, qtype)
    end
		
		count = 0	
		return_data = Hash.new
		return_data[:page] = page
		collect_data = Array.new
				
		@programs.each do |program| 
			if program.deals.length > 0
				program.deals.each do |d|
					if (start..finish) === count
						collect_data << {:cell => [
							 '<a href=list?program_id='+d.program.id.to_s+'>'+d.program.id.to_s+'</a>',
							 d.program.seller.name,
							 d.program.code,
							 d.program.start_date ? d.program.start_date.strftime("%m/%d/%Y") : nil,
							 d.program.end_date ? d.program.end_date.strftime("%m/%d/%Y") : nil,
							 d.program.category.code,
							 d.customer_id,
							 d.status
						 ]}
					end
					count += 1			 
				end
			else
				if (start..finish) === count
					collect_data << {:cell => [
						'<a href=list?program_id='+program.id.to_s+'>'+program.id.to_s+'</a>',
						program.seller.name,
						program.code,
						program.start_date ? program.start_date.strftime("%m/%d/%Y") : nil,
						program.end_date ? program.end_date.strftime("%m/%d/%Y") : nil,
						program.category.code,
						nil,
						nil
					]}
				end
				count += 1
			end
		end
		return_data[:total] = count
		return_data[:rows] = collect_data
    # Convert the hash to a json object
    render :text=>return_data.to_json, :layout=>false
	end
	
end

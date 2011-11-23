class ImportMapsController < ApplicationController
	include ApplicationHelper
	include FileImportHelper
	before_filter :find_maps
	before_filter { |c| c.set_zone "Application" }
	
  def index
		@map = ImportMap.new
  end
	
	def create
		@map = ImportMap.new(params[:import_map])
		@map.account_id = current_account.id
		@map.user_id = current_user
		
		if @map.save
			flash[:success] = "Successfully added a new import map"
			create_import_map_columns
			redirect_to import_maps_path
		else
			redirect_to import_maps_path
		end
	end
	
	def edit
		@map = ImportMap.find(params[:id])
	end
	
	def update
		case params[:update]
		when 'Update'
			@map = ImportMap.find(params[:id])
			if @map.update_attributes(params[:map])
				flash[:success] = "Map updated."
			end
		when 'Import'
			@map = ImportMap.find(params[:id])
			logger.debug "update -> params[:import_map = #{params[:import_map].inspect}"
			if @map.update_attributes(params[:import_map])
				flash[:success] = "Column update successful."	
			else
				flash[:error] = "Update failure."
			end
		end
		redirect_to import_maps_path
	end
	
	def destroy
		ImportMap.find(params[:id]).destroy
    flash[:success] = "Map deleted."
    redirect_to import_maps_path
	end
	
	def select
		@map = ImportMap.find(params[:id])
	end
		
	def complete
		@map = ImportMap.find(params[:import_map_id])
		logger.debug "complete -> @map = #{@map}, params = #{params.inspect}"
		find_import_columns
		logger.debug "complete (after find) -> @import_columns = #{@import_columns.inspect}"
	end
	
	def find_maps
		@maps = ImportMap.find(:all, :conditions => [ "account_id IN (?) OR account_id = (?)", current_partners, current_account])
	end
	
	def create_import_map_columns
		@obj = @map.model_name.constantize
		@target_columns = Array.new
		@obj.columns.each do |c|
			@import = true
			ImportMap::NO_IMPORT.each do |n|
				if c.name == n
					@import = false
					break
				end
			end
			if @import
				@column = @map.import_map_columns.new
				@column.table_column = c.name
				@column.save
			end
		end
	end
	
end

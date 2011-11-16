class ImportMapsController < ApplicationController
	include ApplicationHelper
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
		@map = ImportMap.find(params[:id])
		if @map.update_attributes(params[:map])
			flash[:success] = "Map updated."
			redirect_to import_maps_path
		else
			redirect_to import_maps_path
		end
	end
	
	def destroy
		ImportMap.find(params[:id]).destroy
    flash[:success] = "Map deleted."
    redirect_to import_maps_path
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

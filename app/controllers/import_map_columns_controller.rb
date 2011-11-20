class ImportMapColumnsController < ApplicationController
	include ApplicationHelper
	include FileImportHelper
	before_filter :find_map
	before_filter :find_map_columns
	before_filter { |c| c.set_zone "Application" }
	
  def index	
		logger.debug "index -> #{@import_columns.inspect}"
  end
	
	def create
		logger.debug "create -> #{@import_columns.inspect}"
	end
	
	def open
		case params[:import_file]
		when 'Continue'
			find_import_columns
			logger.debug "open -> #{@import_columns.inspect}"
		when 'Import'
			#update columns
			logger.debug "open -> Import -> Update Columns"
		end
		render :action => 'index'	
	end
	
	def complete
		#TODO update columns
		#redirect_to imported model index
		logger.debug "complete -> #{[params].inspect}"
		@map_columns = ImportMapColumn.update(params[import_map_columns].keys, params[:import_map_columns].values)
		render :action => 'index'	
	end
	
	def import
		
	end
	
	def find_map
		@map = ImportMap.find(params[:import_map_id])
	end
	
	def find_map_columns
		@map_columns = @map.import_map_columns.find(:all)
	end
		
end

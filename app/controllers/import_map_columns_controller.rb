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
		if params[:import_file] == 'Continue'
			find_import_columns
			logger.debug "create -> #{@import_columns.inspect}"
		end
		render :action => 'index'	
	end
	
	def find_map
		@map = ImportMap.find(params[:import_map_id])
	end
	
	def find_map_columns
		@map_columns = @map.import_map_columns.find(:all)
	end
	
	
	
end

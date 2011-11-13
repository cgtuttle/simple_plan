class ImportMapColumnsController < ApplicationController
	include ApplicationHelper
	before_filter :find_map
	before_filter :find_map_columns
	before_filter { |c| c.set_zone "Application" }
	
  def index
		logger.debug "Header checkbox = #{params["headers"]}"
		logger.debug "(csv_import) Map ID = #{params["import_map_id"]}"
		@map_column = ImportMapColumn.new
		@obj = @map.model_name.constantize
		find_target_columns
  end
	
	def create
		
	end
	
	def find_map
		logger.debug "(find_map) Map ID = #{params["import_map_id"]}"
		@map = ImportMap.find(params[:import_map_id])
	end
	
	def find_map_columns
		@map_columns = @map.import_map_columns.find(:all)
	end

	def find_target_columns
		@target_columns = Array.new
		@obj.columns.each do |c|
			#logger.debug "@obj.columns (c) = #{c.name}"
			@import = true
			ImportMapColumn::NO_IMPORT.each do |n|
				#logger.debug "c.name, n = #{n}, #{c.name}"
				if c.name == n
					@import = false
					break
				end
			end
			if @import
				@target_columns << c
			end
		end
	end
	
	def find_import_columns
		@import_columns = Array.new
		
	end
	
end

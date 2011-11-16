class ImportMapColumnsController < ApplicationController
	include ApplicationHelper
	before_filter :find_map
	before_filter :find_map_columns
	before_filter { |c| c.set_zone "Application" }
	
  def index	
		logger.debug "index -> #{@import_columns.inspect}"
  end
	
	def create
		find_import_columns
		logger.debug "create -> #{@import_columns.inspect}"
		render :action => 'index'
	end
	
	def find_map
		@map = ImportMap.find(params[:import_map_id])
	end
	
	def find_map_columns
		@map_columns = @map.import_map_columns.find(:all)
	end

	def find_import_columns
		@import_columns = Array.new
		@parsed_file=CSV::Reader.parse(params[:dump][:file])
		if params["header"] = 1
			@parsed_file.each_with_index do |row, i|
				n = 0
				if i = 1
					row.each do |col|
						@import_columns << col
					end
				end
				break
			end
		end
	end	
end

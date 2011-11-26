module ImportsHelper
	require 'csv'
	
	def import_file
		if params[:file]
			@column_count = 0
			@parsed_file=CSV::Reader.parse(params[:file])
			@row_count = 0
			@parsed_file.each_with_index do |row, i|	
				row.each_with_index do |cell, j|
					@import_file = true
					@cell = @import.cells.new
					@cell.row = i + 1
					@cell.column = j + 1
					@cell.value = cell
					@cell.import_id = @import.id
					@cell.save
					if j+1 > @column_count
						@column_count = j + 1					
					end
				end
				@row_count = i + 1
			end
		else
			@import_file = false
		end
		logger.debug "import_file -> @row_count = #{@row_count}"
	end
	
	def field_choices
		logger.debug "field_choices -> @model = #{@model}"
		logger.debug "field_choices -> @row_count = #{@row_count}"
		@obj = @model.constantize
		@field_choices = Array.new
		@obj.columns.each do |c|
			@import_field = true
			Import::NO_IMPORT.each do |n|
				if c.name == n
					@import_field = false
					break
				end
			end
			if @import_field
				@field_choices << [c.name, c.name]
			end
		end
	end
	
	def save_import
		@obj = @import.model.constantize
		(@first_row..@row_count).each do |i|
			@source = @import.cells.find_all_by_row(i)
			@import_row = Hash.new
			@source.each do |f|
				@import_row[f.destination] = f.value
			end
			logger.debug "save_import -> @import_row = #{@import_row.inspect}"
			@row = @obj.new(@import_row)
			@row.account_id = current_account
			@row.save			
		end		
	end
	
end

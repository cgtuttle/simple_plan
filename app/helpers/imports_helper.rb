module ImportsHelper
	require 'csv'
	
	def import_file
		@column_count = 0
		@parsed_file=CSV::Reader.parse(params[:dump][:file])
		@parsed_file.each_with_index do |row, i|	
			row.each_with_index do |cell, j|
				@cell = @import.cells.new
				@cell.row = i + 1
				@cell.column = j + 1
				@cell.value = cell
				@cell.import_id = @import.id
				@cell.save
				logger.debug "import_file -> @column_count, j = #{@column_count}, #{j}"
				if j+1 > @column_count
					@column_count = j+1					
				end
			end			
		end		
	end
	
	def field_choices
		@obj = @model.constantize
		@field_choices = Array.new
		@obj.columns.each_with_index do |c, i|
			@import_field = true
			Import::NO_IMPORT.each do |n|
				if c.name == n
					@import_field = false
					break
				end
			end
			if @import_field
				@field_choices << [c.name, i]
			end
		end
	end
	
end

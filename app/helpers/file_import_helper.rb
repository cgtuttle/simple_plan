module FileImportHelper

	def find_import_columns
		@import_columns = Array.new
		@parsed_file=CSV::Reader.parse(params[:dump][:file])
		logger.debug "find_import_columns -> header = #{params['header']}, @parsed_file = #{@parsed_file}"		
		if params['header'] == '1'
			@parsed_file.each_with_index do |row, i|				
				if i == 0
					row.each do |col|
						@import_columns << col
					end
				end
				break
			end		
		else
			@parsed_file.each_with_index do |row, i|
				if i == 0
					row.each_with_index do |col, j|
					 @import_columns << j + 1
					end
				end
				break
			end			
		end
		logger.debug "find_import_columns -> @import_columns = #{@import_columns.inspect}"
	end
end
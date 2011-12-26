module PlansHelper
	
	def fill_dataset
		@dataset = Array.new
		@r = 1
		@programs.each do |@p| 
			if !@p.deals.blank? 
				@p.find_deals.each do |@d| 
					if !@d.deal_products.blank? 
						@d.find_deal_products.each do |@dp| 
							if !@dp.deal_activities.blank? 
								@dp.find_deal_activities.each do |@da|
									fill_base_data																 
								end 
							else 
								@da = nil
								fill_base_data		
							end 
						end 
					else 
						@da = nil
						@dp = nil
						fill_base_data		
					end 
				end 
			else 
				@da = nil
				@dp = nil
				@d = nil
				fill_base_data		
			end 
		end 
	end
	
	
	def fill_base_data
		 @dataset << {
					:row => @r.to_s,
					:rep => @p.seller.name.to_s,
					:program => @p.code,
					:program_start => @p.start_date.to_s,
					:program_end => @p.end_date.to_s,
					:customer => (@d != nil ? @d.customer.name : nil),
					:deal => (@d != nil ? @d.id.to_s : nil),
					:product => (@dp != nil ? @dp.product.code : nil),
					:activity => (@da != nil ? @da.activity.name : nil)
				}
		@r+=1
	end
	
	def format_cell(data, index, new_format, prev_format, row)
		logger.debug "format_cell -> data index @prev, #{data}, #{index}, #{@prev}"
		if data
			if @prev[index] == data  								
				@td[index] = "<td class='#{prev_format}'>#{data}</td>"
				@tr = false
			else																									
				@td[index] = "<td class='#{new_format}'>#{data}</td>"
				@tr = (row > 1)
			end 
			@prev[index] = data
		else
			@td[index] = "<td></td>"
			@prev[index] = nil
			@tr = false
		end
		
	end
	
	
end
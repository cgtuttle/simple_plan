class Setting < ActiveRecord::Base
	
	def self.find_setting(profile, type, model, column)
		self.where(:profile_id => profile, :type_name => type, :model_name => model, :column_name => column).first
	end
	

end

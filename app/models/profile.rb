class Profile < ActiveRecord::Base
	attr_accessible :name, :first_name, :last_name
	
	belongs_to :user
	
		
end

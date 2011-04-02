class Rep < ActiveRecord::Base
	attr_accessible :code, :name
	
	has_many :programs
end

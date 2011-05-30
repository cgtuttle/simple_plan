class Supplier < ActiveRecord::Base
	attr_accessible :code, :name, :domain

	has_many :categories
	has_many :programs
	
	validates 	:code,		:presence => true,
												:length => { :maximum => 25 },
												:uniqueness => { :case_sensitive => false }
	
end

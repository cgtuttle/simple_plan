class Deal < ActiveRecord::Base
	belongs_to :program
	belongs_to :customer
	
end

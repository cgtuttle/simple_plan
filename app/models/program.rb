class Program < ActiveRecord::Base
	
	has_many :deals
	belongs_to :seller
	belongs_to :supplier
end

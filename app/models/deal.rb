class Deal < ActiveRecord::Base
	attr_accessible :code, :product_id, :rate, :start_date, :end_date

	belongs_to :program
end

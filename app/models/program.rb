class Program < ActiveRecord::Base
	attr_accessible :code, :name, :descr, :supplier_id, :category_id, :rep_id, :customer_id, :start_date, :end_date

	has_many :deals
	belongs_to :rep
	belongs_to :supplier
end

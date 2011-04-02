class Category < ActiveRecord::Base
	attr_accessible :code, :name, :supplier_id

	has_many :products
	has_many :programs
	belongs_to :supplier
end

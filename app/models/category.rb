class Category < ActiveRecord::Base
	attr_accessible :code, :name, :supplier_id

	belongs_to :supplier
end

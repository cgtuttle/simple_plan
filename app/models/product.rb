class Product < ActiveRecord::Base
	attr_accessible :code, :descr

	belongs_to :category
	has_many :deals
end

class CategoryProduct < ActiveRecord::Base
	has_many :categories
	has_many :products
end

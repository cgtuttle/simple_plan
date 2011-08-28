class Category < ActiveRecord::Base
	belongs_to :account
	belongs_to :category_product
end

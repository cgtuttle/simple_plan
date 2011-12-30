class CategoryAccount < ActiveRecord::Base
	belongs_to :category
	belongs_to :account
end

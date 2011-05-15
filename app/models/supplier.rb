class Supplier < ActiveRecord::Base
	attr_accessible :code, :name, :domain

	has_many :categories
	has_many :programs
end

class Import < ActiveRecord::Base
	has_many :cells
	belongs_to :account
	
	accepts_nested_attributes_for :cells
	
	require 'csv'
	
	
	NO_IMPORT = %w[id account_id created_at updated_at]
	MODELS = %w{Activity Category Deal Product}
	
end

class ImportMap < ActiveRecord::Base
	has_many :import_map_columns
	belongs_to :account
	
	accepts_nested_attributes_for :import_map_columns
	
	
	NO_IMPORT = %w[id account_id created_at updated_at]
	MODELS = %w{Activity Category Deal Product}
end

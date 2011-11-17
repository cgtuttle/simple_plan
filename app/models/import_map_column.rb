class ImportMapColumn < ActiveRecord::Base
	belongs_to :import_map
	
	NO_IMPORT = %w[id account_id created_at updated_at]
	
	
end

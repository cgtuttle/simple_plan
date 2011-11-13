class ImportMap < ActiveRecord::Base
	has_many :import_map_columns
	belongs_to :account
	
	MODELS = %w[Product Deal Category Customer Program]
	
end

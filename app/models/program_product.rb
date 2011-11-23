class ProgramProduct < ActiveRecord::Base
	belongs_to :program
	belongs_to :product
end

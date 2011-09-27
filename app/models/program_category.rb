class ProgramCategory < ActiveRecord::Base
	belongs_to :program
	belongs_to :category
end

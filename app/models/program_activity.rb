class ProgramActivity < ActiveRecord::Base
	belongs_to :program
	belongs_to :activity
end

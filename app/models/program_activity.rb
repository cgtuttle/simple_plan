class ProgramActivity < ActiveRecord::Base
	has_many :programs
	has_many :activities
end

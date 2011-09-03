class ProgramCategory < ActiveRecord::Base
	has_many 	:programs
	has_many	:categories
end

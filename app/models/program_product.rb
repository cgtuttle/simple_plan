class ProgramProduct < ActiveRecord::Base
	has_many	:programs
	has_many:	:products
end

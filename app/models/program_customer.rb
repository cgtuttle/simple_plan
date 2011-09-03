class ProgramCustomer < ActiveRecord::Base
	has_many	:programs
	has_many	:customers
end

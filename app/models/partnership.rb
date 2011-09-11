class Partnership < ActiveRecord::Base
	belongs_to	:account
	belongs_to	:partner,	:class_name => "Account"

	TYPE = %w[customer supplier seller]

end

class Partnership < ActiveRecord::Base
	belongs_to	:provider,	:class_name => "Account"
	belongs_to	:customer,	:class_name => "Account"
	belongs_to	:seller,		:class_name => "Account"
end

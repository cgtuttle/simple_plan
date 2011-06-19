class Account < ActiveRecord::Base

	belongs_to :account_group, :foreign_key => "account_group"

end

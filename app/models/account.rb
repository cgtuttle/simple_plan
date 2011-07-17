class Account < ActiveRecord::Base

	belongs_to :service
	has_many :profiles

end

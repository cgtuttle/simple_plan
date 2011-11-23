class Account < ActiveRecord::Base

	has_many 	:users
	has_many 	:categories
	has_many 	:products
	has_many 	:activities
	has_many 	:programs
  has_many  :deals
	has_many	:plans
	has_many	:import_maps
	
	has_many	:partnerships	
	has_many	:partners,	:through => :partnerships, :source => "partner"
	has_many	:partnerships_from, :class_name => "Partnership", :foreign_key => "partner_id"
	has_many	:partners_from,	:through => :partnerships_from,	:source => :account
	
	CAN_SIGN_UP = Rails.application.config.allow_account_sign_up
	
	SERVICE = %w[customer supplier seller]
	

end

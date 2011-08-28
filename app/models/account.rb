class Account < ActiveRecord::Base

	has_many :users
	has_many :categories
	has_many :products
	has_many :activities
	
	has_many :supplier_partners,	:foreign_key => 'supplier_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :suppliers,					:through => :supplier_partners
	has_many :programs,						:through => :supplier_partners
	
	has_many :customer_partners,	:foreign_key => 'customer_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :customers,					:through => :customer_partners
	has_many :deals,							:through => :customer_partners
	
	has_many :seller_parners,			:foreign_key => 'seller_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :sellers,						:through => :seller_partners
	has_many :programs,						:through => :seller_partners
	
	
	CAN_SIGN_UP = Rails.application.config.allow_account_sign_up
	
	SERVICE = %w[customer supplier seller]
	
end

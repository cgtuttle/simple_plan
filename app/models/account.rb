class Account < ActiveRecord::Base

	belongs_to :service
	has_many :users
	
	has_many :provider_partners,	:foreign_key => 'provider_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :providers,					:through => :provider_partners
	
	has_many :customer_partners,	:foreign_key => 'customer_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :customers,					:through => :customer_partners
	
	has_many :seller_parners,			:foreign_key => 'seller_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :sellers,						:through => :seller_partners
	
	CAN_SIGN_UP = Rails.application.config.allow_account_sign_up
	
end

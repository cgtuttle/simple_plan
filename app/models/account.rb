class Account < ActiveRecord::Base

	belongs_to :service
	has_many :profiles
	
	has_many :provider_partners,	:foreign_key => 'provider_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :providers,					:through => :provider_partners
	
	has_many :customer_partners,	:foreign_key => 'customer_id',
																:class_name => 'Partnership',
																:dependent => :destroy
																
	has_many :customers,					:through => :customer_partners
	
end

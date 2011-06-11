class User_role < ActiveRecord::Base
	attr_accessible :user_id, :role_id
	
	
	belongs_to :user
	belongs_to :role
	
	validates :user_id, :presence => true
	validates :role_id,	:presence => true
	
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id, :role
	
	validates :email, :presence => true, :uniqueness => true
	
	has_one :profile
	after_create :setup_profile
	
	ROLES = %w[sysadmin admin manager user]
	
	def setup_profile
		Profile.create(:user_id => self.id, :name => self.email)
	end
	
	
	
end

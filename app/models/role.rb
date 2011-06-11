class Role < ActiveRecord::Base
	has_many :user_roles
	has_many :users, :through => :roles
	
	validates :name, 	:presence 	=> true,
										:length			=> { :maximum => 50 },
										:uniqueness => true
	
	
end

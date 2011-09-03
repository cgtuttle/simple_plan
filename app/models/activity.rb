class Activity < ActiveRecord::Base

has_many 		:deals
belongs_to	:account
belongs_to	:program_activity

validates :name, 	:presence 	=> true,
									:length			=> { :maximum => 50 },
									:uniqueness => true

end

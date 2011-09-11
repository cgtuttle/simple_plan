class Activity < ActiveRecord::Base

has_many 		:deals
belongs_to	:account
belongs_to	:program_activity

validates :code, 	:presence 	=> true,
									:length			=> { :maximum => 31 }

end

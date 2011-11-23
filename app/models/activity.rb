class Activity < ActiveRecord::Base

has_many 		:deal_activities
belongs_to	:account
belongs_to	:program_activity

validates :code, 	:presence 	=> true,
									:length			=> { :maximum => 31 }

end

class Activity < ActiveRecord::Base
attr_accessible :name

has_many :deals

validates :name, 	:presence 	=> true,
									:length			=> { :maximum => 50 },
									:uniqueness => true

end

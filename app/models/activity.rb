class Activity < ActiveRecord::Base
attr_accessible :type

has_many :deals

end

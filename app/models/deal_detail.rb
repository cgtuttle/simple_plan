class DealDetail < ActiveRecord::Base
	belongs_to	:deal
  belongs_to  :product
  belongs_to  :activity
end

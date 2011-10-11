class AddAllocationToDealActivities < ActiveRecord::Migration
  def change
		add_column	:deal_activities,	:volume_allocation,	:float
  end
end

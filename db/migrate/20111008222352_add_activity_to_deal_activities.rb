class AddActivityToDealActivities < ActiveRecord::Migration
  def change
		add_column	:deal_activities, :activity_id, :integer
  end
end

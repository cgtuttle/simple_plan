class AddDatesToDealActivitiesAgain < ActiveRecord::Migration
  def change
		add_column :deal_activities, :start_date, :datetime
    add_column :deal_activities, :end_date, :datetime
  end
end

class AddReleaseStatusToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :release_status, :boolean
		add_column :plans, :owner_id, :integer
  end
end

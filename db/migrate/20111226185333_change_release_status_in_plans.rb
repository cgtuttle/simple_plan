class ChangeReleaseStatusInPlans < ActiveRecord::Migration
  def up
		change_column :plans, :release_status, :integer
  end

  def down
  end
end

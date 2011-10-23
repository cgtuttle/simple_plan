class ChangeDateNamesInPlans < ActiveRecord::Migration
  def up
		rename_column	:plans, :date_start, :start_date
		rename_column :plans, :date_end,	:end_date
  end

  def down
  end
end

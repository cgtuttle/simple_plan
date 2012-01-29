class ChangeProgramBudgetVolName < ActiveRecord::Migration
  def up
		rename_column :programs, :budget_vol, :budget_volume
  end

  def down
		rename_column :programs, :budget_volume, :budget_vol
  end
end

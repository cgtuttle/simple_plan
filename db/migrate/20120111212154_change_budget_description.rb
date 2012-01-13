class ChangeBudgetDescription < ActiveRecord::Migration
  def up
		rename_column :budgets, :description, :descr
  end

  def down
  end
end

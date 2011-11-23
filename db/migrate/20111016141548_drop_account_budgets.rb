class DropAccountBudgets < ActiveRecord::Migration
  def up
		drop_table	:account_budgets
  end

  def down
  end
end

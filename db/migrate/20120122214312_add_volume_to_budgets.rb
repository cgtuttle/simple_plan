class AddVolumeToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :budget_volume, :decimal
  end
end

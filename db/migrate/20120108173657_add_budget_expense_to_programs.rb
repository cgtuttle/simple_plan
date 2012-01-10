class AddBudgetExpenseToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :budget_expense, :decimal
  end
end

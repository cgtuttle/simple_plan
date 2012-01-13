class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :code
      t.string :description
      t.integer :account_id
      t.date :start_date
      t.date :end_date
      t.decimal :budget_expense

      t.timestamps
    end
  end
end

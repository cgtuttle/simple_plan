class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :code
      t.string :name
      t.string :descr
      t.integer :account_id
      t.date :date_start
      t.date :date_end
      t.float :budget

      t.timestamps
    end
  end
end

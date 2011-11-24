class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :account_id
      t.integer :user_id
      t.string :model
      t.integer :first_row

      t.timestamps
    end
  end
end

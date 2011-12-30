class CreateCategoryAccounts < ActiveRecord::Migration
  def change
    create_table :category_accounts do |t|
      t.integer :category_id
      t.integer :account_id

      t.timestamps
    end
  end
end

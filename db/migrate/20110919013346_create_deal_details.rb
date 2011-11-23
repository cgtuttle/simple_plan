class CreateDealDetails < ActiveRecord::Migration
  def change
    create_table :deal_details do |t|
      t.integer :deal_id
      t.integer :product_id
      t.integer :activity_id
      t.float :rate
      t.float :volume

      t.timestamps
    end
  end
end

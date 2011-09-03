class CreateProgramProducts < ActiveRecord::Migration
  def self.up
    create_table :program_products do |t|
      t.integer :program_id
      t.integer :product_id
      t.integer :customer_id
      t.integer :category_id
      t.float :plan_rate
      t.float :plan_vol

      t.timestamps
    end
  end

  def self.down
    drop_table :program_products
  end
end

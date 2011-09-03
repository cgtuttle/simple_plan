class CreateProgramCustomers < ActiveRecord::Migration
  def self.up
    create_table :program_customers do |t|
      t.integer :program_id
      t.integer :customer_id
      t.float :vol_alloc

      t.timestamps
    end
  end

  def self.down
    drop_table :program_customers
  end
end

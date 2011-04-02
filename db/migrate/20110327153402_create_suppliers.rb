class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :code
      t.string :name
      t.string :domain

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end

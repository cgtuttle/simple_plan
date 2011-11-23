class DropDomainTables < ActiveRecord::Migration
  def self.up
		drop_table :customers
		drop_table :reps
		drop_table :suppliers
  end

  def self.down
  end
end

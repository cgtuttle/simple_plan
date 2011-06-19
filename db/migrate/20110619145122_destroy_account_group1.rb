class DestroyAccountGroup1 < ActiveRecord::Migration
  def self.up
		drop_table :account_groups
  end

  def self.down
  end
end

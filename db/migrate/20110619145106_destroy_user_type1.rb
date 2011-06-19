class DestroyUserType1 < ActiveRecord::Migration
  def self.up
		drop_table :user_types
  end

  def self.down
  end
end

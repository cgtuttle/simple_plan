class RemoveTableUserRoles < ActiveRecord::Migration
  def self.up
		drop_table :User_roles
  end

  def self.down
  end
end

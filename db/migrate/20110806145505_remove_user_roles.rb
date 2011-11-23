class RemoveUserRoles < ActiveRecord::Migration
  def self.up
		drop_table :user_roles
  end

  def self.down
  end
end

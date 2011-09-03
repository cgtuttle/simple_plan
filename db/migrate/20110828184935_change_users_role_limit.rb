class ChangeUsersRoleLimit < ActiveRecord::Migration
  def self.up
		change_column :users, :role, :string, :limit => 63
  end

  def self.down
		change_column :users, :role, :string, :limit => 255
  end
end

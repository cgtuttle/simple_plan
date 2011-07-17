class RenameGroupsToServices < ActiveRecord::Migration
  def self.up
		rename_table :groups, :services
  end

  def self.down
		rename_table :services, :groups
  end
end

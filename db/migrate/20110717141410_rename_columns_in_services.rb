class RenameColumnsInServices < ActiveRecord::Migration
  def self.up
		rename_column :accounts, :group_id, :service_id
  end

  def self.down
		rename_column :accounts, :service_id, :group_id
  end
end

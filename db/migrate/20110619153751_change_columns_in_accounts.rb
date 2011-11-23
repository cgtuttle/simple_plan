class ChangeColumnsInAccounts < ActiveRecord::Migration
  def self.up
		rename_column :accounts, :account_group, :group_id
		remove_column :accounts, :class_id
  end

  def self.down
		rename_column :accounts, :group_id, :account_group
		add_column :accounts, :class_id, :integer
  end
end

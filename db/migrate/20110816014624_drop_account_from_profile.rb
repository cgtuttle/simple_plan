class DropAccountFromProfile < ActiveRecord::Migration
  def self.up
		remove_column :profiles, :account_id
  end

  def self.down
  end
end

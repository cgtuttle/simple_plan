class AddAccountToUser < ActiveRecord::Migration
  def self.up
		add_column :users, :account_id, :integer
  end

  def self.down
		drop_column :users, :account_id
  end
end

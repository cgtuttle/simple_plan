class RemoveEmailConfirmationFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :email_confirmation
  end

  def self.down
    add_column :users, :email_confirmation, :string
  end
end

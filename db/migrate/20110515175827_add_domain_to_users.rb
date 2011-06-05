class AddDomainToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :domain, :string
		add_column :users, :type_id, :integer
  end

  def self.down
    remove_column :users, :domain
		remove_column :users, :type_id
  end
end

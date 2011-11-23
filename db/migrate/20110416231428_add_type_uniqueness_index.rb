class AddTypeUniquenessIndex < ActiveRecord::Migration
  def self.up
		add_index :activities, :type, :unique => true
  end

  def self.down
		remove_index :activities, :type
  end
end

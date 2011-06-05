class RemoveTableDomains < ActiveRecord::Migration
  def self.up
		drop_table :domains
  end

  def self.down
  end
end

class DropDomainClasses < ActiveRecord::Migration
  def self.up
		drop_table :domain_classes
  end

  def self.down
  end
end

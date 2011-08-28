class ChangeCategoriesCode < ActiveRecord::Migration
  def self.up
		change_table :categories do |t|
			t.change :code, :string, :limit => 15
			t.change :name, :string, :limit => 63
			t.rename :supplier_id, :account_id
		end
  end

  def self.down
		change_table :categories do |t|
			t.change :code, :string, :limit => nil
			t.change :name, :string, :limit => nil
			t.rename :account_id, :supplier_id
		end
  end
end

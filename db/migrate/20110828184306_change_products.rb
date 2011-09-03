class ChangeProducts < ActiveRecord::Migration
  def self.up
		change_table :products do |t|
			t.remove :category_id
			t.integer :account_id
			t.change :code, :string, :limit => 15
			t.string :name, :limit => 127
		end
  end

  def self.down
		change_table :products do |t|
			t.integer :category_id
			t.remove :account_id
			t.change :code, :string, :limit => 255
			t.remove :name
		end
  end
end

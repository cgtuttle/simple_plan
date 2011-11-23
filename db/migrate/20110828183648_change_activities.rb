class ChangeActivities < ActiveRecord::Migration
  def self.up
		change_table :activities do |t|
			t.string :code, :limit => 15
			t.change :name, :string, :limit => 127
			t.string :descr
			t.integer :account_id
		end
  end

  def self.down
		change_table :activities do |t|
			t.remove :code
			t.change :name, :string, :limit => 255
			t.remove :descr
			t.remove :account_id
		end
  end
end

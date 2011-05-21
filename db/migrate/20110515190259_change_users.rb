class ChangeUsers < ActiveRecord::Migration
  def self.up
		change_table :users do |t|
			t.remove :name
		end
  end

  def self.down
		add_column :users, :name, :string
  end
end

class UpdateDeals < ActiveRecord::Migration
  def self.up
		change_table :deals do |t|
			t.integer :program_id
			t.integer	:category_id
			t.integer :customer_id
			t.integer :activity_id
			t.rename :rate, :deal_rate
			t.float :deal_vol
			t.change :code, :string, :limit => 15
		end
  end

  def self.down
  end
end

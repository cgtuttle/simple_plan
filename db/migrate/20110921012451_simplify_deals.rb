class SimplifyDeals < ActiveRecord::Migration
  def up
		change_table :deals do |t|
			t.remove :product_id, :deal_rate, :start_date, :end_date, 
				:activity_id, :deal_vol
		end
  end

  def down
  end
end

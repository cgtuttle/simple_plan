class CreateDealActivities < ActiveRecord::Migration
  def change
    create_table		:deal_activities do |t|
			t.integer			:deal_product_id
			t.float				:rate
			t.float				:volume
      t.timestamps
    end
  end
end

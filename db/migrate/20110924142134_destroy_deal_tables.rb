class DestroyDealTables < ActiveRecord::Migration
  def up
    drop_table  :deal_products
    drop_table  :deal_activities
  end

  def down
  end
end

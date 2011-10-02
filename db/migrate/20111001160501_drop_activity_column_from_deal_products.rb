class DropActivityColumnFromDealProducts < ActiveRecord::Migration
  def up
		remove_column	:deal_products, :activity_id
  end

  def down
  end
end

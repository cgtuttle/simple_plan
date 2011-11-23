class RenameDealDetails < ActiveRecord::Migration
  def up
		rename_table	:deal_details, :deal_products
  end

  def down
		rename_table	:deal_products, :deal_details
  end
end

class AddSellerAndSupplierToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :seller_id, :integer
    add_column :plans, :supplier_id, :integer
  end
end

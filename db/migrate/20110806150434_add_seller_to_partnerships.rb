class AddSellerToPartnerships < ActiveRecord::Migration
  def self.up
    add_column :partnerships, :seller_id, :integer
  end

  def self.down
    remove_column :partnerships, :seller_id
  end
end

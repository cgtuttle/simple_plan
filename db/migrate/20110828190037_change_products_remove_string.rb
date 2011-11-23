class ChangeProductsRemoveString < ActiveRecord::Migration
  def self.up
		remove_column :products, :string
  end

  def self.down
		add_column	:products, :string, :string
  end
end

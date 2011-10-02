class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :code
      t.integer :product_id
      t.float :rate
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :deals
  end
end

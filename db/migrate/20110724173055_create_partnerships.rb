class CreatePartnerships < ActiveRecord::Migration
  def self.up
    create_table :partnerships do |t|
      t.integer :provider_id
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :partnerships
  end
end

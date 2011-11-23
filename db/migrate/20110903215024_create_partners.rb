class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.integer :account_id
      t.integer :partner_id
      t.string :partner_type

      t.timestamps
    end
  end

  def self.down
    drop_table :partners
  end
end

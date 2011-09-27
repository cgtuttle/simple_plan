class RemoveProgramCustomers < ActiveRecord::Migration
  def up
    drop_table  :program_customers
  end

  def down
  end
end

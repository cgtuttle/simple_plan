class UpdateAccounts < ActiveRecord::Migration
  def self.up
		change_table :accounts do |t|
			t.remove	:domain
			t.rename	:service_id, :service
			t.change	:service, :string,	:limit => 63
		end
  end

  def self.down
		change_table :accounts do |t|
			t.add	:domain, :string
			t.rename	:service, :service_id
			t.change	:service_id, :integer
		end
  end
end

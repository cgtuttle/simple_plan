class AddDeviseInvitableFields < ActiveRecord::Migration
  def self.up
		change_table :users do |t|
			t.string   :invitation_token, :limit => 60
			t.datetime :invitation_sent_at
			t.index    :invitation_token
		end

		# Allow null encrypted_password
		change_column_null :users, :encrypted_password, true
		# Allow null password_salt (add it if you are using Devise's encryptable module)
		#change_column_null :users, :password_salt, true
		
  end

  def self.down
  end
end

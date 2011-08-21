class User < ActiveRecord::Base
	belongs_to :account

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :email, :presence => true, :uniqueness => true
	validates :account_id, :presence => true
	
  # Setup accessible (or protected) attributes for your model	
	attr_accessor :account_name  # used to create a account
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id, :role, :account_id, :account_name
	
	before_validation :create_account, :on => :create
	after_create :setup_profile
	after_create :update_account_owner
	
	has_one :profile
	
	ROLES = %w[sysadmin admin manager user]
	
	private
	
	def setup_profile
		Profile.create(:user_id => self.id, :name => self.email)
	end

  def create_account
    # create an account on creating a new user
    # if the account does not exist - sign_up only
    # sets up for validate_presence of account_name to fail if blank or not unique
    if self.account_name.blank?
      return
    end
    acct = Account.find_by_name(self.account_name) 
    if acct.nil? 
      self.account = Account.create!(:name => self.account_name)
    else
      self.account_name = "" if !Account::CAN_SIGN_UP
    end
  end

  def update_account_owner
    # set owner of account to user that created it
    account = self.account
    if account && account.user_id.nil?
      account.user_id = self.id
      account.save
      self.role = "admin"
      self.save
    end
  end	
end

class User < ActiveRecord::Base
	attr_accessor		:password
	attr_accessible :first_name, :last_name, :domain, :user_name,
									:email, :email_confirmation, 
									:password, :password_confirmation
									
	has_many :user_roles
	has_many :roles, :through => :user_roles
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name,  :length   => { :maximum => 70 }
	validates :last_name,		:length => { :maximum => 70} 
	validates :user_name,		:length => { :maximum => 70 }
													
	# Automatically create the virtual attribute 'email_confirmation'.
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
										:uniqueness => { :case_sensitive => false },
										:confirmation => true
	# Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
											 
	before_save :encrypt_password
	
	# Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
	
	def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
	
	def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
	
	private

    def encrypt_password
			self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
		
		def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end

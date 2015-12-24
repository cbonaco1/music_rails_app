class User < ActiveRecord::Base
  attr_reader :password
  #This is called when an AR obj is instantiated
  #(either by using .new or when a record is loaded from the DB)
  #and is run before validation
  #Without this, the User obj was not being created since it was not valid,
  #because it was not given a session_token yet
  after_initialize :ensure_session_token

  #Note: any attribute can be validated (not just columns)
  validates :email, :session_token, presence: true
  validates :password_digest, presence: { message: "Password cannot be blank"}
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  #instance variable @password is used
  #to perform the validation on it, since it is not a column in DB
  #The attr_reader allows the validation to read the value
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    if user
      if user.is_password?(password)
        return user
      else
        return nil
      end
    else
      return nil
    end
  end

  private
  #This returns the existing token, or generates a new one
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end

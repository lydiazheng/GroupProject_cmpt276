class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :default_values


  def default_values
    self.email = email.downcase

  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  COMPLEX_PASSWORD_REGEX = /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&><+`*-]).{6,}\z/
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :firstname, presence: true, length: { maximum: 64 }
  validates :username, presence: true, length: { maximum: 64 }, uniqueness: { case_sensitive: false }
  validates :lastname, length: { maximum: 64 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, format: {with: COMPLEX_PASSWORD_REGEX , message: "must be at least 6 characters and include uppercase and lowercase letters, digit and symbol."}, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes.
def create_reset_digest
  self.reset_token = User.new_token
  update_attribute(:reset_digest,  User.digest(reset_token))
  update_attribute(:reset_sent_at, Time.zone.now)
end

# Sends password reset email.
 def send_password_reset_email
   UserMailer.password_reset(self).deliver_now
 end

end

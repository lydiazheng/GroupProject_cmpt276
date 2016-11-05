class User < ActiveRecord::Base
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
  validates :password, presence: true, length: { minimum: 6 }, format: {with: COMPLEX_PASSWORD_REGEX , message: "must be at least 6 characters and include uppercase and lowercase letters, digit and symbol."}

end

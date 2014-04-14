class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true)
  validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true)
  before_save {self.email = email.downcase}
  has_secure_password
  validates :password, length: { minimum: 6 }
end

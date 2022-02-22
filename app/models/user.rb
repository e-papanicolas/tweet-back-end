class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "please enter a valid email address" }
end

# URI::MailTo::EMAIL_REGEXP
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
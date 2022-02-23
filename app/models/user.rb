class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_secure_password
  has_many :events, dependent: :destroy

  has_one_attached :image

  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "please enter a valid email address" }

  def get_image_url
    if self.image
     url_for(self.image)
    else
      url_for('../assets/images/default.jpeg')
    end
  end

end

# URI::MailTo::EMAIL_REGEXP
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
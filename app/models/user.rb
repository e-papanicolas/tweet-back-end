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
    url_for(self.image) 
  rescue NoMethodError 
    url_for('../images/default-user-image.png')
  end

end
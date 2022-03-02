class Event < ApplicationRecord
  belongs_to :user  
  has_many :tweets  
  has_many :subscribers, class_name: 'User'

  
  validates :hashtag, format: { without: /\S/, message: "No spaces please" }
  validates :hashtag, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only letters and numbers are allowed" }

  validates :timeout, presence: true

  def save
    TwitterStream.new_rule(self)
    super
  end
end

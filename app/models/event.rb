class Event < ApplicationRecord
  belongs_to :user  
  has_many :tweets  
  has_many :subscribers, class_name: 'User'

  # validates :hashtag
  
  # format: { with: /\A[a-zA-Z]+\z/,
  #   message: "only allows letters" }



  def save
    TwitterStream.new_rule(self)
    super
  end
end

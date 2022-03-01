class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :timeout, :hashtag, :rule_id

  has_many :tweets, serializer: TweetSerializer
end

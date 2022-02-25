class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :hashtag, :rule_id

  has_many :tweets, serializer: TweetSerializer
end

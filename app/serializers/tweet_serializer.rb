class TweetSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :tweeted_at, :hashtags, :retweet_count, :reply_count, :like_count, :quote_count

  belongs_to :event
end

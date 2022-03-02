class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :timeout, :hashtag, :rule_id, :tweets

end

class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :hashtag, :rule_id
end

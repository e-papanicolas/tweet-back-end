class TweetChannel < ApplicationCable::Channel
  def subscribed
   stream_from "tweet_#{params[:rule]}"
  end

  # def receive(data)
  #   ActionCable.server.broadcast("tweet_#{event.rule_id}", { body: "testing testing"});
  # end
end

class TweetChannel < ApplicationCable::Channel
  def subscribed
   stream_from "tweet_#{params[:rule]}"
  end
end

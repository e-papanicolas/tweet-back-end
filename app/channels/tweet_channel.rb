class TweetChannel < ApplicationCable::Channel
  def subscribed
   stream_from "tweet_#{params[:event]}"
   
  end
end
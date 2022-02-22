class TweetController < ApplicationController

  def index 
    # not sure if i will use this, or if i can get current event,tweets then yes
  end

  def show 
    tweet = find_tweet
    render json: tweet, serializer: TweetSerializer
  end

  private

  def get_tweet 
    Tweet.find_by(id: params[:tweet_id])
  end
end
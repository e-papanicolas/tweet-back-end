class EventsController < ApplicationController
  

  def create 
    ActionCable.server.broadcast("tweet_1492913662872465411", { body: "testing testing"});
  end
end

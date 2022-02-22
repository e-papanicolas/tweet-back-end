class EventsController < ApplicationController
  
  def index 
    user = current_user
    render json: user.events, status: :ok
  end

  def show 
    event = get_event
    render json: event, serializer: EventSerializer
  end

  def create 
    ActionCable.server.broadcast("tweet_1492913662872465411", { body: "testing testing"});
  end

  def update 
    event = get_event 
    event.update!(event_params)
    render json: event, serializer: EventSerializer
  end

  def destroy 
    event = get_event 
    event.destroy
    head :no_content
  end

  private

  def get_event 
    Event.find_by(id: params[:event_id])
  end

  def event_params 
    params.permit(:name, :date, :hashtag, :rule_id)
  end
end

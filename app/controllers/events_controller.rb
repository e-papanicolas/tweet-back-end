class EventsController < ApplicationController
  
  # def index 
  #   user = current_user
  #   render json: user.events, status: :ok
  # end

  def show 
    event = get_event
    render json: event, serializer: EventSerializer
  end
  
  def start_streaming 
    puts "Starting streaming"
    event = get_event
    ActionCable.server.broadcast("tweet_#{event.rule_id}", { body: "starting twitter streaming"});
    EventMaker.start(event)
  end

  def create 
    user = current_user
    new_event = Event.new(event_params)
    new_event.save
    render json: new_event, serializer: EventSerializer, status: :created
  end

  # def update 
  #   event = get_event 
  #   event.update!(event_params)
  #   render json: event, serializer: EventSerializer
  # end

  def destroy 
    event = get_event 
    TwitterStream.delete_single_rule(event.rule_id)
    event.destroy
    render json: Event.all
  end

  private

  def get_event 
    Event.find_by(id: params[:id])
  end

  def event_params 
    params.permit(:name, :timeout, :hashtag, :rule_id, :user_id, :id) 
  end
end

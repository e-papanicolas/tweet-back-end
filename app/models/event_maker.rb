class EventMaker < ApplicationRecord

  def self.start(event)
    @event = event
    

    EventMachine.run {



      @channel = EM::Channel.new

      @twitter_stream = TwitterStream.stream_connect(@event)
    
    
      EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080, :debug => true) do |ws|
    
        ws.onopen {
          sid = @channel.subscribe { |msg| ws.send msg }
          @channel.push "#{sid} connected!"
    
          ws.onmessage { |msg|
            @channel.push "<#{sid}>: #{msg}"
          }
    
          ws.onclose {
            @channel.unsubscribe(sid)
          }
        }
    
      end
    
      puts "Server started"
    }
  end
  
end


# def self.stream 
#   client = Twitter::Streaming::Client.new do |config|
#     config.consumer_key        = ENV["TWITTER_API_KEY"]
#     config.consumer_secret     = ENV["TWITTER_API_KEY_SECRET"]
#     config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
#     config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
#   end

#   client.filter(locations: "-122.75,36.8,-121.75,37.8") do |tweet|
#     puts tweet.text
#   end
# end
# proxy = {
#   host: "proxy.example.com",
#   port: 8080,
#   username: "proxy_username",
#   password: "proxy_password"
# }
# config.proxy               = proxy
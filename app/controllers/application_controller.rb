class ApplicationController < ActionController::Base
  before_action :authorized
  skip_before_action :verify_authenticity_token

  JWT_SECRET = ENV["JWT_SECRET"]

  def encode_token(payload)
    JWT.encode(payload, JWT_SECRET)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin  
        JWT.decode(token, JWT_SECRET, true, algorithm: 'HS256') 
      rescue JWT::DecodeError
        nil
      end 
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def render_unprocessable_response(invalid)
    render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end 

  def render_not_found_response
    render json: { error: "Not found"}, status: :not_found
  end

end

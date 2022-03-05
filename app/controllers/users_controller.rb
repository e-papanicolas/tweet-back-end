class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index  
    render json: User.all
  end
  
  def create 
    
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({user_id: @user.id})
      render json: { user: UserCreateSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update 
    user = get_user
    user.update!(update_params)
    render json: { user: UserSerializer.new(user) }
  end

  def me
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def destroy
    user_to_destroy = current_user
    user_to_destroy.destroy
    head :no_content
  end

  private

  def get_user
    User.find_by(id: params[:id])
  end

  def update_params
    params.permit(:image, :bio, :username, :first_name, :last_name)
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end

end

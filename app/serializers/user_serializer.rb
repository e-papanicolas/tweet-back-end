class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :first_name, :last_name, :email, :bio, :get_image

  has_many :events

  def get_image
    self.object.get_image_url()
  end

  # def serialize_user 
  #   {
  #     user: {
  #       id: user.id,
  #       username: user.username,
  #       first_name: user.first_name,
  #       last_name: user.last_name,
  #       email: user.email,
  #       bio: user.bio,
  #       image: image.get_image_url()
  #     }
  #   }
  # end

end

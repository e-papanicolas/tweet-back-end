class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :first_name, :last_name, :email, :bio, :get_image

  has_many :events

  def get_image
    self.object.get_image_url()
  end

end

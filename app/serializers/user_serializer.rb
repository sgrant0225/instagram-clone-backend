class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :photo
  has_many :posts
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :photo
  
end

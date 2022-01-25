class PostSerializer < ActiveModel::Serializer
  attributes :id, :image, :likes, :caption
  
end

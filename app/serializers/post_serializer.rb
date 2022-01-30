class PostSerializer < ActiveModel::Serializer
  attributes :id, :image, :likes, :caption
  belongs_to :user
  
end


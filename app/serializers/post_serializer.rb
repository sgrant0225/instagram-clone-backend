class PostSerializer < ActiveModel::Serializer
  attributes :id, :image, :likes, :caption, :username, :photo
  has_many :comments


  def username
    self.object.user.username
end  

def photo 
  self.object.user.photo
end  
  # belongs_to :user
  
end


class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :username

  def username 
    self.object.user.username
  end  
end

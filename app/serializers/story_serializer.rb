class StorySerializer < ActiveModel::Serializer
  attributes :id, :file_type, :file, :user

  def user
    UserSerializer.new(object.user).as_json[:user]
  end
end

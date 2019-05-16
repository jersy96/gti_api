class StorySerializer < ActiveModel::Serializer
  attributes :id, :file_type, :file

  def file
    object.complete_file_url
  end
end

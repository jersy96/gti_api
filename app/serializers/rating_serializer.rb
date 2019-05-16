class RatingSerializer < ActiveModel::Serializer
  attributes :id, :score, :comment, :student

  def student
    StudentSerializer.new(object.student).as_json[:student]
  end
end

class RatingSerializer < ActiveModel::Serializer
  attributes :id, :score, :comment
end

class TutorSerializer < ApplicationSerializer
  attributes :id, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :description, :price, :average, :subjects, :comments, :rating

  def subjects
    serialize_each(object.subjects.order(:name), SubjectSerializer)
  end

  def comments
    object.ratings.order('created_at DESC').pluck(:comment).compact
  end

  def rating
    object.ratings.average(:score).to_f
  end
end

class TutorSerializer < ApplicationSerializer
  attributes :id, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :description, :price, :average, :subjects, :comments, :rating, :profile_picture, :firebase_token

  def subjects
    serialize_each(object.subjects.order(:name), SubjectSerializer)
  end

  def comments
    serialize_each(object.ratings.order('created_at DESC'), RatingSerializer)
  end

  def rating
    object.ratings.average(:score).to_f
  end

  def profile_picture
    object.complete_profile_picture_url
  end
end

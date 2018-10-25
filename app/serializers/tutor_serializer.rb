class TutorSerializer < ApplicationSerializer
  attributes :id, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :description, :price, :average, :subjects

  def subjects
    serialize_each(object.subjects.order(:name), SubjectSerializer)
  end
end

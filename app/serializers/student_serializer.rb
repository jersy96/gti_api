class StudentSerializer < ApplicationSerializer
  attributes :id, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :university, :career, :profile_picture

  def profile_picture
    object.complete_profile_picture_url
  end
end

class UserSerializer < ApplicationSerializer
  attributes :id, :email, :role, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :profile_picture

  def profile_picture
    object.complete_profile_picture_url
  end
end

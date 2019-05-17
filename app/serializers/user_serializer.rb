class UserSerializer < ApplicationSerializer
  attributes :id, :type, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :profile_picture

  def type
    object.type.downcase
  end

  def profile_picture
    object.complete_profile_picture_url
  end
end

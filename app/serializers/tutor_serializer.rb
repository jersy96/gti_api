class TutorSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :description, :price, :average
end

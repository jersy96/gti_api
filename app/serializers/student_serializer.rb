class StudentSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone, :university, :career
end

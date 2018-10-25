class UserSerializer < ApplicationSerializer
  attributes :id, :email, :role, :first_name, :second_name, :first_lastname, :second_lastname, :address, :phone, :cellphone
end

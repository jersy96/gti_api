class User < ApplicationRecord
  #Dependencies
  has_secure_password

  #Validations
  validates :email, :first_name, :first_lastname, presence: true
  validates :email, format: {with: /\A(^\S+)@(.[a-zA-Z0-9]+)+\z/}, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true
end

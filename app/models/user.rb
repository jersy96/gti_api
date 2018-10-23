class User < ApplicationRecord
  #Dependencies
  has_secure_password

  #Enums
  enum role: {admin:0, tutor:1, student:2}

  #Validations
  validates :email, :password, :first_name, :first_lastname, presence: true
  validates :email, format: {with: /\A(^\S+)@(.[a-zA-Z0-9]+)+\z/}, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true
  validates :phone, :cellphone, numericality: true, allow_blank: true
end

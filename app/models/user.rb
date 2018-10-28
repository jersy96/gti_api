class User < ApplicationRecord
  #Dependencies
  has_secure_password

  #Validations
  validates :email, :first_name, :first_lastname, presence: true
  validates :email, format: {with: /\A(^\S+)@(.[a-zA-Z0-9]+)+\z/}, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true

  #Callbacks
  before_save :format_names

  #Methods
  protected
  def format_names
    self.first_name.downcase!
    self.first_lastname.downcase!
    self.second_name.downcase! if self.second_name
    self.second_lastname.downcase! if self.second_lastname
  end
end

class User < ApplicationRecord
  #Dependencies
  has_secure_password

  #Uploaders
  mount_uploader :profile_picture, ProfilePictureUploader

  # Relationships
  has_many :story

  #Validations
  validates :email, :first_name, :first_lastname, presence: true
  validates :email, format: {with: /\A(^\S+)@(.[a-zA-Z0-9]+)+\z/}, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true

  #Callbacks
  before_save :format_names

  #Methods
  def complete_profile_picture_url
    if self.profile_picture.present?
      "#{ENV['MULTIMEDIA_SERVER_URL']}#{self.profile_picture.url}"
    end
  end

  def fullname
    fname = first_name
    fname = "#{fname} #{second_name}" if second_name.present?
    fname = "#{fname} #{first_lastname}"
    fname = "#{fname} #{second_lastname}" if second_lastname.present?
    fname
  end

  protected
  def format_names
    self.first_name.downcase!
    self.first_lastname.downcase!
    self.second_name.downcase! if self.second_name
    self.second_lastname.downcase! if self.second_lastname
  end
end

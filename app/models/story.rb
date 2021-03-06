class Story < ApplicationRecord
  #Uploaders
  mount_uploader :file, StoryUploader

  # Relationships
  belongs_to :user

  # Validations
  validates :file_type, :file, presence: true
  validate_enum_attribute :file_type

  # Enums
  enum file_type: {image: 0, video: 1}

  # Callbacks
  after_create :set_expiration_time

  # Methods
  def complete_file_url
    if self.file.present?
      "#{ENV['MULTIMEDIA_SERVER_URL']}#{self.file.url}"
    end
  end

  protected
  def set_expiration_time
    update_column(:expiration_time, Time.now + 24.hours)
  end
end

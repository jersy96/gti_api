class Subject < ApplicationRecord
  # Relationships
  has_and_belongs_to_many :tutors, association_foreign_key: 'tutor_id', join_table: 'subjects_tutors', before_add: :validate_uniqueness

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true, allow_blank: true

  #Callbacks
  before_save :format_name

  # Methods
  private
  def validate_uniqueness(tutor)
    raise ActiveRecord::Rollback if self.tutors.include? tutor 
  end

  def format_name
    self.name.downcase!
  end
end

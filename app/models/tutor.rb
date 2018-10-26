class Tutor < User
  # Relationships
  has_one :profile, class_name: 'TutorProfile', inverse_of: :tutor, dependent: :destroy, autosave: true
  has_and_belongs_to_many :subjects, association_foreign_key: 'subject_id', join_table: 'subjects_tutors', before_add: :validate_uniqueness
  has_many :solicitudes

  # Dependencies
  delegate :description, :description=, :price, :price=, :average, :average=, to: :lazily_build_profile

  # Validations
  validates :price, presence: true, if: Proc.new { |tutor| tutor.type == 'Tutor' }

  # Methods
  private
  def lazily_build_profile
    profile || build_profile
  end

  def validate_uniqueness(subject)
    raise ActiveRecord::Rollback if self.subjects.include? subject
  end
end

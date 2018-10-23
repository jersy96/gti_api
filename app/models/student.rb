class Student < User
  has_one :profile, class_name: 'StudentProfile', inverse_of: :student, dependent: :destroy, autosave: true

  delegate :university, :university=, :career, :career=, to: :lazily_build_profile

  private
  def lazily_build_profile
    profile || build_profile
  end
end

class Student < User
  # Relationships
  has_one :profile, class_name: 'StudentProfile', inverse_of: :student, dependent: :destroy, autosave: true
  has_many :solicitudes
  has_many :ratings

  # Dependencies
  delegate :university, :university=, :career, :career=, to: :lazily_build_profile

  # Methods
  def become_tutor(tutor_params={})
    self.type = 'Tutor'
    self.save
    tutor = Tutor.find(self.id)
    tutor.attributes = tutor_params
    if tutor.valid?
      self.profile.destroy
      tutor.save
    else
      tutor2 = Tutor.find(self.id)
      tutor2.type = 'Student'
      tutor2.save
    end
    tutor
  end

  private
  def lazily_build_profile
    profile || build_profile
  end
end

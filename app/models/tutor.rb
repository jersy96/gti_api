class Tutor < User
  has_one :profile, class_name: 'TutorProfile', inverse_of: :tutor, dependent: :destroy, autosave: true

  delegate :description, :description=, :price, :price=, :average, :average=, to: :lazily_build_profile

  validates :price, presence: true, if: Proc.new { |tutor| tutor.type == 'Tutor' }

  private
  def lazily_build_profile
    profile || build_profile
  end
end

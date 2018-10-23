class TutorProfile < ApplicationRecord
  belongs_to :tutor, inverse_of: :profile
  validates :tutor, presence: true
end

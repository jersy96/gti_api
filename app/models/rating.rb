class Rating < ApplicationRecord
  # Relationships
  belongs_to :tutor
  belongs_to :student

  # Validations
  validates :score, presence: true
end

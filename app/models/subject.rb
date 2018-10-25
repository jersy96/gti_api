class Subject < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true, allow_blank: true
end

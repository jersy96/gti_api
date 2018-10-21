class Token < ApplicationRecord
  # Relationships
  belongs_to :user

  # Callbacks
  has_secure_token :secret
end

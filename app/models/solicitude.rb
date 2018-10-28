class Solicitude < ApplicationRecord
  # Relationships
  belongs_to :tutor
  belongs_to :student

  # Dependencies
  has_secure_token :transaction_id

  # Enums
  enum solicitude_type: {single:0, group:1}, _suffix: :type
  enum payment_method: {cash:0, credit_card:1}, _prefix: :paid_in

  # Validations
  validates :solicitude_type, :payment_method, :hours, :address, :date, presence: true
  validate_enum_attribute :payment_method, :solicitude_type

  # Callbacks
  after_save :set_attendants, if: Proc.new { |sol| sol.single_type? }

  # Methods
  def set_attendants
    self.attendants = 1
  end
end

require_relative './validators/domain_validator'

# Port model
class Port < ActiveRecord::Base
  acts_as_paranoid

  validates :name, presence: true, length: { maximum: 255 }
  validates :host, presence: true, domain: true
  validates :port, presence: true, :numericality => {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 65535
  }
  validates :probe_interval, presence: true, :numericality => { only_integer: true }

  scope :active, -> { where(active: true) }
end


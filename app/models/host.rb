require_relative './validators/url_validator'

# Host model
class Host < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, url: true
  validates :probe_interval, presence: true, :numericality => { only_integer: true }

  scope :active, -> { where(active: true) }
end


class Link < ApplicationRecord
  attr_accessor :seconds

  belongs_to :user
  has_many :visits

  validates :long_url, presence: true

  before_create :set_short_url
  before_create :set_available_at

  scope :active, -> { where(active: true) }

  def set_short_url
    self.short_url = Array.new(6) { Array('a'..'z').sample }.join
  end

  def set_available_at
    return if seconds.empty?

    self.available_at = Time.zone.now + seconds
    self.active = false
  end
end

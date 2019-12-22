class Link < ApplicationRecord
  belongs_to :user

  validates :long_url, presence: true
end

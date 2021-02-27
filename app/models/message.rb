class Message < ApplicationRecord
  belongs_to :country
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
end

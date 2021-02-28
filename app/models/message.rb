class Message < ApplicationRecord
  belongs_to :country
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
end

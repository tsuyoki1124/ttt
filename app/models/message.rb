class Message < ApplicationRecord
  belongs_to :country
  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true

end

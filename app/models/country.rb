class Country < ApplicationRecord
  has_many :country_users, dependent: :destroy
  has_many :users, through: :country_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end

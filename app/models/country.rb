class Country < ApplicationRecord
  has_many :country_users
  has_many :users, through: :country_users

  validates :name, presence: true
end

class Message < ApplicationRecord
  belongs_to :country
  belongs_to :user
end

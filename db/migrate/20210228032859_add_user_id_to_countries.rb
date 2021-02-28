class AddUserIdToCountries < ActiveRecord::Migration[6.0]
  def change
    add_reference :countries, :user, foreign_key: true
  end
end

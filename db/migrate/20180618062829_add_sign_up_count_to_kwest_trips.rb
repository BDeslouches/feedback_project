class AddSignUpCountToKwestTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :kwest_trips, :sign_ups_count, :integer
  end
end

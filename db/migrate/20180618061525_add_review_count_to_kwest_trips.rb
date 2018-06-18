class AddReviewCountToKwestTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :kwest_trips, :reviews_count, :integer
  end
end

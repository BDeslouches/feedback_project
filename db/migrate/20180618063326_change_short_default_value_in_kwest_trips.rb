class ChangeShortDefaultValueInKwestTrips < ActiveRecord::Migration[5.0]
  def change
    change_column_default :kwest_trips, :short, 'No'
  end
end

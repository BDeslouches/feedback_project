class CreateKwestTrips < ActiveRecord::Migration
  def change
    create_table :kwest_trips do |t|
      t.text :trip_name
      t.string :region_name
      t.boolean :short

      t.timestamps

    end
  end
end

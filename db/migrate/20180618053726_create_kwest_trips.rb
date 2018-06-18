class CreateKwestTrips < ActiveRecord::Migration
  def change
    create_table :kwest_trips do |t|
      t.text :name
      t.date :start_date
      t.date :end_date
      t.integer :enrollment_id

      t.timestamps

    end
  end
end

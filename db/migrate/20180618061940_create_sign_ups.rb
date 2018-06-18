class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.integer :kwestee_id
      t.integer :trip_id

      t.timestamps

    end
  end
end

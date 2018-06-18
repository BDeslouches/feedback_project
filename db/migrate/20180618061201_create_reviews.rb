class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body

      t.timestamps

    end
  end
end

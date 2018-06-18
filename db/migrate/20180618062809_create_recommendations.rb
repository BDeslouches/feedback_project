class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body
      t.string :rec_type

      t.timestamps

    end
  end
end

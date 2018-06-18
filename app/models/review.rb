class Review < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :class_name => "KwestTrip",
             :foreign_key => "recipient_id",
             :counter_cache => true

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

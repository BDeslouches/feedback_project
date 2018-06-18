class Recommendation < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :class_name => "KwestTrip",
             :foreign_key => "recipient_id",
             :counter_cache => :reviews_count

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :reviews_count

  # Indirect associations

  # Validations

end

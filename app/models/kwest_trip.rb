class KwestTrip < ApplicationRecord
  # Direct associations

  has_many   :sign_ups,
             :foreign_key => "trip_id",
             :dependent => :destroy

  has_many   :reviews,
             :class_name => "Recommendation",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

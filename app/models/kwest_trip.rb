class KwestTrip < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :foreign_key => "recipient_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

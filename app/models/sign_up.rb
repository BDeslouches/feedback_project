class SignUp < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :class_name => "KwestTrip",
             :counter_cache => true

  # Indirect associations

  # Validations

end

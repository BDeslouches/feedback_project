class SignUp < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :class_name => "KwestTrip",
             :counter_cache => true

  belongs_to :kwestee,
             :class_name => "User"

  # Indirect associations

  # Validations

end

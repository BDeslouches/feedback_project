class Review < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

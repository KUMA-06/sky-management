class Category < ApplicationRecord
  with_options uniqueness: true, allow_nil: true do
    validates :dining
    validates :dinner_wait
    validates :dinner_preparation
    validates :bath_time
    validates :bath_wait
    validates :escape
  end

  belongs_to :tour
end

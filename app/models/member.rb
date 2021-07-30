class Member < ApplicationRecord
  validates :group, presence: true
  validates :nickname, presence: true
  
  belongs_to :tour
end

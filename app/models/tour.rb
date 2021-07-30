class Tour < ApplicationRecord
  validates :place, presence: true

  has_many :members
  belongs_to :user
end

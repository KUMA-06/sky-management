class Tour < ApplicationRecord
  validates :place, presence: true

  has_many :members, dependent: :destroy
  belongs_to :user
end

class Tour < ApplicationRecord
  validates :place, presence: true

  has_many :members, dependent: :destroy
  has_many :categories, dependent: :destroy
  belongs_to :user
end

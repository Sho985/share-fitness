class Bodyweight < ApplicationRecord
  belongs_to :user
  validates :bodyweight, presence: true
end

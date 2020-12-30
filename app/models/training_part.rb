class TrainingPart < ApplicationRecord
  validates :part, presence: true
  belongs_to :user
  belongs_to :post
end

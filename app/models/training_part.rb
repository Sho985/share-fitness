class TrainingPart < ApplicationRecord
  validates :part, presence: true, uniqueness: { scope: :post,
  message: "が重複しています。" }
  belongs_to :user
  belongs_to :post
end

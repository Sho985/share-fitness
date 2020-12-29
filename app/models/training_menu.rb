class TrainingMenu < ApplicationRecord
  #postモデルに関連付け
  belongs_to :post
  # validates :part, presence: true
  validates :event, presence: true
  validates :weight, presence: true
  validates :repetition, presence: true
  validates :set_count, presence: true

end

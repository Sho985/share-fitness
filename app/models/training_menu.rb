class TrainingMenu < ApplicationRecord
  belongs_to :training_event
  validates :weight, presence: true
  validates :repetition, presence: true
  validates :set_count, presence: true

end

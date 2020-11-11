class Post < ApplicationRecord
  validates :comment, presence: true, length:{maximum: 100}
  validates :part, presence: true
  validates :discipline, presence: true
  validates :weight, presence: true
  validates :number, presence: true
end

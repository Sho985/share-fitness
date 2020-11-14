class Post < ApplicationRecord
  validates :comment, presence: true, length:{maximum: 100}
end

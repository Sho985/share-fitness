class Question < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true
  validates :question_content, presence: true
  belongs_to :user

  mount_uploader :question_image,  QuestionimageUploader
end

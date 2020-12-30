class Post < ApplicationRecord
  validates :comment, presence: true, length:{maximum: 100}
  validates :training_events, presence: true
  validates :training_parts, presence: true

  belongs_to :user

  has_many :training_events, dependent: :destroy
  accepts_nested_attributes_for :training_events, reject_if: :all_blank, allow_destroy: true

  has_many :training_parts, dependent: :destroy
  accepts_nested_attributes_for :training_parts,reject_if: :all_blank ,allow_destroy: true


  #carriewave・Postモデルとの紐付け
  mount_uploader :image,  PostimageUploader
  
  has_many :likes, dependent: :destroy
  #ユーザーがいいねしているのかを確認するメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  #commentモデルと関連付け
  has_many :comments, dependent: :destroy

  def start_time
    self.created_at
  end
end

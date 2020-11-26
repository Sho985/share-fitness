class Post < ApplicationRecord
  validates :comment, presence: true, length:{maximum: 100}
  validates :training_menus, presence: true
  belongs_to :user
  #training_menuモデルとの関連付け/training_menuモデルをPostモデルにネストさせる。
  has_many :training_menus, dependent: :destroy
  accepts_nested_attributes_for :training_menus, reject_if: :all_blank, allow_destroy: true

  #carriewave・Postモデルとの紐付け
  mount_uploader :image,  PostimageUploader
  
  has_many: likes
  #ユーザーがいいねしているのかを確認するメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end

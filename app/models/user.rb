class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :self_introduction, presence: true
  validates :image, presence: true
  
  #carriewave・Userモデルとの紐付け
  mount_uploader :image,  UserimageUploader

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  
  #commentモデルと関連付け
  has_many :comments

  has_many :training_parts, dependent: :destroy

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  #フォローしているユーザーとの関係性。
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  
  #フォローされる側の関係性
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  #フォローしているのかの確認
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end

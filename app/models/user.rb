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
end

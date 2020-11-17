class Post < ApplicationRecord
  validates :comment, presence: true, length:{maximum: 100}
  #training_menuモデルとの関連付け/training_menuモデルをPostモデルにネストさせる。
  has_many :training_menus, dependent: :destroy
  accepts_nested_attributes_for :training_menus, reject_if: :all_blank, allow_destroy: true
end

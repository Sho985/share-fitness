class TrainingEvent < ApplicationRecord
  belongs_to :post

  validates :event, presence: true
  validates :training_menus, presence: true
  
  has_many :training_menus, dependent: :destroy
  accepts_nested_attributes_for :training_menus, reject_if: :all_blank, allow_destroy: true
end

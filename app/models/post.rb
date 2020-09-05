class Post < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 150 }

  accepts_nested_attributes_for :photos
end

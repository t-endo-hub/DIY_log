class Comment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true, length: { maximum: 150 }
end

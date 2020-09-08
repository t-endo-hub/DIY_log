class Post < ApplicationRecord
  attachment :image

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 150 }
  validates :image_id, presence: true

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end

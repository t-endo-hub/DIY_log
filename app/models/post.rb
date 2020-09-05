class Post < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 150 }

  accepts_nested_attributes_for :photos

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end

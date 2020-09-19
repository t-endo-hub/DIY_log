class Recipe < ApplicationRecord
  attachment :image
  belongs_to :post

  validates :content, presence: true, length: { maximum: 150 }

  def previous
    Recipe.where('id < ?', id).order('id DESC').first
  end

  def next
    Recipe.where('id > ?', id).order('id ASC').first
  end

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end

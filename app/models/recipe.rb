class Recipe < ApplicationRecord
  attachment :image
  belongs_to :post

  def previous
    Recipe.where('id < ?', id).order('id DESC').first
  end

  def next
    Recipe.where('id > ?', id).order('id ASC').first
  end
end

class Recipe < ApplicationRecord
  belongs_to :post
  mount_uploader :image, ImageUploader

  def previous
    Recipe.where("id < ?", self.id).order("id DESC").first
  end
   
  def next
    Recipe.where("id > ?", self.id).order("id ASC").first
  end
end

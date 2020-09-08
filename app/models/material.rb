class Material < ApplicationRecord
  belongs_to :post

  validates :name, presence: true
  validates :quantity, presence: true
end

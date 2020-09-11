class Order < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum payment: { "クレジットカード": 0, "銀行振り込み": 1 }
end

class Order < ApplicationRecord
  belongs_to :customer

  validates :customer, presence: true
  validates :product_name, presence: true
  validates :product_count, presence: true
end

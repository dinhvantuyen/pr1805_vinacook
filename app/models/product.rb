class Product < ApplicationRecord
  has_many :product_orders
  has_many :rates
  has_many :comments
  has_many :product_categories
end

class Product < ApplicationRecord
  has_many :product_orders
  has_many :rates
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  mount_uploader :image, PictureUploader
end

class Product < ApplicationRecord
  has_many :product_orders
  has_many :reviews
  has_many :rates
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :price, presence: true
  mount_uploader :image, PictureUploader
  scope :best_product, -> {order sale_count: :desc}
end

class Product < ApplicationRecord
  has_many :product_orders
  has_many :rates
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  mount_uploader :image, PictureUploader
  enum status:  [:Conhang, :hethang]

  validates :name, presence:true, uniqueness: true
  default_scope -> { order(created_at: :desc)}
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ },
  numericality: { greater_than: 0, less_than: 1000000}
  validates :sale_price, presence: true, allow_blank: true, format: { with: /\A\d+(?:\.\d{2})?\z/ },
  numericality: { greater_than: 0, less_than: 1000000}
end

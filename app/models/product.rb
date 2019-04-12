class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :rates
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :price, presence: true
  validates :name, presence:true, uniqueness: true
  default_scope -> { order(created_at: :desc)}
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ },
  numericality: { greater_than: 0, less_than: 1000000}
  validates :sale_price, presence: true, allow_blank: true, format: { with: /\A\d+(?:\.\d{2})?\z/ },
  numericality: { greater_than: 0, less_than: 1000000}
  mount_uploader :image, PictureUploader
  scope :best_product, -> {order sale_count: :desc}
  scope :search_name, -> (name) {where("name like ?", "%#{name}%")}
  scope :search_product_category, -> (category_id){joins(:product_categories).where("category_id = #{category_id}")}
  scope :search_product_name, -> (name, category_id){joins(:product_categories).where("category_id = #{category_id}").where("name like ?", "%#{name}%")}
end

class Address < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :city, presence: true
end

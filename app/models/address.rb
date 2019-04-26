class Address < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end

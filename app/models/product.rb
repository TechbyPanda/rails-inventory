class Product < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :warehouses, through: :inventories

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
end
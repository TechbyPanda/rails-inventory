class Warehouse < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
class Inventory < ApplicationRecord
  # Relationships
  belongs_to :product
  belongs_to :warehouse

  # Validations
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :reserved_quantity, numericality: { greater_than_or_equal_to: 0 }
  validate :reserved_cannot_exceed_total_quantity

  # Business Logic Helpers
  def available_stock
    quantity - reserved_quantity
  end

  private

  def reserved_cannot_exceed_total_quantity
    if reserved_quantity > quantity
      errors.add(:reserved_quantity, "cannot be greater than total physical quantity")
    end
  end
end

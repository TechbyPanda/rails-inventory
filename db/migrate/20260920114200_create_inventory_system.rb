# here 6.0 what is this and how should i check that this is correct
class CreateInventorySystem < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :sku, null: false
      t.decimal :price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
    add_index :products, :sku, unique: true # Add an index to the SKU column for faster lookups and enforce uniqueness

    create_table :warehouses do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :city

      t.timestamps
    end
    add_index :warehouses, :code, unique: true # Add an index to the code column for faster lookups and enforce uniqueness

    create_table :inventories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 0
      t.integer :reserved_quantity, null: false, default: 0

      t.timestamps
    end
    add_index :inventories, [:product_id, :warehouse_id], unique: true # Add a composite index to ensure that each product-warehouse combination is unique
  end
end
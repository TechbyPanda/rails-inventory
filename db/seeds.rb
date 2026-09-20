# db/seeds.rb

# Clear existing data to avoid duplication errors on re-runs
Inventory.destroy_all
Product.destroy_all
Warehouse.destroy_all

# Create Products
echo_dot = Product.create!(name: "Amazon Echo Dot", sku: "AMZN-ECHODOT-05", price: 49.99)
kindle = Product.create!(name: "Kindle Paperwhite", sku: "AMZN-KINDLE-11", price: 139.99)

# Create Warehouses
fc_east = Warehouse.create!(name: "Fulfillment Center East", code: "FC-NY-01", city: "New York")
fc_west = Warehouse.create!(name: "Fulfillment Center West", code: "FC-CA-02", city: "San Francisco")

# Allocate Stock manually using the join table
Inventory.create!(product: echo_dot, warehouse: fc_east, quantity: 150, reserved_quantity: 10)
Inventory.create!(product: echo_dot, warehouse: fc_west, quantity: 80, reserved_quantity: 0)

Inventory.create!(product: kindle, warehouse: fc_east, quantity: 200, reserved_quantity: 45)

puts "Successfully seeded Amazon Inventory Models manually!"

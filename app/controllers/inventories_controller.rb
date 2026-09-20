class InventoriesController < ApplicationController
  def index
    # Fetch all inventory entries and preload related data to prevent slow N+1 queries
    @inventories = Inventory.includes(:product, :warehouse).all
  end

  def adjust
    # Find the specific row using the ID from the URL parameter
    @inventory = Inventory.find(params[:id])
    
    # Extract the adjustment quantity from our upcoming form (e.g., +50 or -10)
    adjustment = params[:adjustment_amount].to_i

    # Calculate the new total physical stock safely
    new_quantity = @inventory.quantity + adjustment

    if new_quantity >= 0
      @inventory.update!(quantity: new_quantity)
      flash[:notice] = "Stock updated successfully for #{@inventory.product.name}!"
    else
      flash[:alert] = "Error: Stock cannot fall below 0 units."
    end

    # Redirect the user right back to the dashboard to see the live updates
    redirect_to inventories_path
  end
end

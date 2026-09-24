class InventoriesController < ApplicationController
  def index
    # Fetch all inventory entries and preload related data to prevent slow N+1 queries
    @inventories = Inventory.includes(:product, :warehouse).all
  end

  def adjust
    @inventory = Inventory.find(params[:id])
    adjustment = params[:adjustment_amount].to_i
    new_quantity = @inventory.quantity + adjustment

    if new_quantity >= 0
      @inventory.update!(quantity: new_quantity)
      respond_to do |format|
        format.html do
          flash[:notice] = "Stock updated successfully for #{@inventory.product.name}! New quantity: #{new_quantity} units."
          redirect_to inventories_path
        end
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "Error: Stock cannot fall below 0 units."
          redirect_to inventories_path
        end
        format.json { render json: { error: "Stock cannot fall below 0" }, status: :unprocessable_entity }
      end
    end
  end
end

# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart
  
  # POST /line_items or /line_items.json
  def create
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item)
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to request.referer
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end
end

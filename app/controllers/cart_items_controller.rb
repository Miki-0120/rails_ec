# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: %i[show edit update destroy]
  # GET /line_items or /line_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show; end

  # GET /line_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /line_items/1/edit
  def edit; end

  # POST /line_items or /line_items.json
  def create
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item)
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to request.referer
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    @cart_item.update(cart_item_params)
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to request.referer
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @cart_item.destroy
    redirect_to request.referer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :cart_id)
  end
end

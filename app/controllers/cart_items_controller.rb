# frozen_string_literal: true

class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
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
    redirect_to request.referer
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to cart_item_url(@cart_item), notice: '正常に更新されました' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:cart_item).permit(:item_id)
  end
end

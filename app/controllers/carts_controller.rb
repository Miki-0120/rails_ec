# frozen_string_literal: true

class CartsController < ApplicationController
  # GET /carts/1 or /carts/1.json
  def show
    @cart = Cart.find(params[:id])
    @cart_items = @cart.cart_items
    @total_price = @cart_items.to_a.sum(&:total_price)
    @total_price_all = @cart_items.sum(&:total_price)
    @order = Order.new
    @promotion_code = PromotionCode.new
    @discount = PromotionCode.find_by(code: session[:register_code])
  end
end

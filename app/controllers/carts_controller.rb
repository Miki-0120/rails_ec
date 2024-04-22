# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
    @cart_items = @cart.cart_items
    @total_price = @cart_items.to_a.sum(&:total_price)
    @total_price_all = @cart_items.sum(&:total_price)
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to request.referer
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    @cart.update(cart_params)
    redirect_to request.referer
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to request.referer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.fetch(:cart, {})
  end
end

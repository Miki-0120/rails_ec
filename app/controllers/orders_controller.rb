# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart

  def show
    @orders = @cart.orders
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    @order = Order.new(order_params)

    @order.cart = @cart

    ActiveRecord::Base.transaction do
      @order.save!
      cart_items = @cart.cart_items.all

      cart_items.each do |item|
        order_item = OrderItem.new(
          order: @order,
          item: item.item,
          name: item.item.name,
          price: item.item.price,
          quantity: item.quantity
        )
        order_item.save!
      end
    end

    @cart.cart_items.destroy_all
    redirect_to items_path, notice: '購入ありがとうございます'
  end

  private

  def order_params
    params.require(:order).permit(%i[order_id first_name last_name user_name email address address_2 country state zip
                                     name_on_card credit_card_number expiration cvv])
  end
end

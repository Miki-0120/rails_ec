# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart
  before_action :basic_auth

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    @order = Order.new(order_params)

    @order.cart = @cart

    if @cart.cart_items.empty?
      redirect_to request.referer, alert: 'カートが空です'
      return
    end

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
    OrderMailer.with(order: @order).order_email.deliver_now
    @cart.cart_items.destroy_all
    redirect_to items_path, notice: '購入ありがとうございます'
  rescue ActiveRecord::RecordInvalid
    redirect_to request.referer, alert: 'お客様情報を正しく入力してください'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to request.referer, notice: '注文が削除されました'
  end

  def order_total_price
    @order_total_price_all = @order_items.sum(&:order_total_price)
  end

  private

  def order_params
    params.require(:order).permit(%i[order_id first_name last_name user_name email address address_2 country state zip
                                     name_on_card credit_card_number expiration cvv])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end
end

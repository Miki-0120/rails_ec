# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_email
    @order = params[:order]
    @order_items = @order.order_items.all
    @discount = @order.promotion_code&.discount
    mail(to: @order.email, subject: 'ご注文ありがとうございます')
  end
end

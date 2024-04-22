# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= @cart.id
  end
end
#こちら初回の場合に、session[:cart_id]に格納されていないので、
#session[:cart_id]に@cart.idを格納しましょう。

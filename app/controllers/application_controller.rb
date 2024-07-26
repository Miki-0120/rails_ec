# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= @cart.id
  end
end

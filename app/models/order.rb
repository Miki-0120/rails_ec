# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart
  has_many :order_items, dependent: :destroy

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :user_name
    validates :address
    validates :country
    validates :state
    validates :zip
    validates :name_on_card
    validates :credit_card_number
    validates :expiration
    validates :cvv
  end

  def order_total_price_all
    order_items.sum { |item| item.price * item.quantity }
  end
end

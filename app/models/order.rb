# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart
  has_many :order_item, dependent: :destroy

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
end

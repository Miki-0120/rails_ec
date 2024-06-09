# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_item, dependent: :destroy
  has_many :cart, through: :cart_items

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :item_image
  end
  has_one_attached :item_image
end

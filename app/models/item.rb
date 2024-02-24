# frozen_string_literal: true

class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :item_image
  end
  has_one_attached :item_image
end

# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name,
            presence: true
  validates :price,
            presence: true
  validates :description,
            presence: true
  validates :item_image,
            presence: true

  has_one_attached :item_image
end

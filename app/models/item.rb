# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :item_image
end

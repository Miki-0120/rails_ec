# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_lin_item

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :item_image
  end
  has_one_attached :item_image
end

 private

# この商品を参照しているLineItemがないことを確認する
def ensure_not_referenced_by_any_line_items
  return if line_items.empty?

  errors.add(:base, '商品が存在します。')
  throw :abort
end

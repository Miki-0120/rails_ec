# frozen_string_literal: true

class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    # カート内に１つの商品に対して複数のLineItemがあった場合は１つのLineItemに置き換える
    Cart.all.find_each do |cart|
      # カート内の各商品の数をカウントする
      sums = cart.line_items.group(:item_id).sum(:quantity)

      sums.each do |item_id, quantity|
        next unless quantity > 1

        # 個別のLineItemを削除する
        cart.line_items.where(item_id:).delete_all

        # 1つのLineItemに置き換える
        item = cart.line_items.build(item_id:)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    # 数量>1 のLineItemを複数のLineItemに分割する
    LineItem.where('quantity >1').find_each do |line_item|
      # 個別のLineItemを追加する
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          item_id: line_item.item_id,
          quantity: 1
        )
      end

      # 元のLineItemを削除する
      line_item.destroy
    end
  end
end

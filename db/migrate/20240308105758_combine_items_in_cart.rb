# frozen_string_literal: true

class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    # カート内に１つの商品に対して複数のCartItemがあった場合は１つのCartItemに置き換える
    Cart.all.find_each do |cart|
      # カート内の各商品の数をカウントする
      sums = cart.cart_items.group(:item_id).sum(:quantity)

      sums.each do |item_id, quantity|
        next unless quantity > 1

        # 個別のCartItemを削除する
        cart.cart_items.where(item_id:).delete_all

        # 1つのCartItemに置き換える
        item = cart.cart_items.build(item_id:)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    # 数量>1 のCartItemを複数のCartItemに分割する
    CartItem.where('quantity >1').find_each do |cart_item|
      # 個別のCartItemを追加する
      cart_item.quantity.times do
        CartItem.create(
          cart_id: cart_item.cart_id,
          item_id: cart_item.item_id,
          quantity: 1
        )
      end
    end
  end
end

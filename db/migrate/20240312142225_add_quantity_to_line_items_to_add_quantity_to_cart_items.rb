class AddQuantityToLineItemsToAddQuantityToCartItems < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :cart_items, :quantity, :bigint, default: 1
    end
  end
end

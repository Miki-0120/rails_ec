# frozen_string_literal: true

class AddQuantityToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :quantity, :bigint, default: 1
  end
end

# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :item
      t.belongs_to :cart
      t.bigint :quantity, default: 0
      t.timestamps
    end
  end
end

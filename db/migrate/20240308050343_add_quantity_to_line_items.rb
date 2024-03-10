class AddQuantityToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :quantity, :bigint, default: 1
  end
end

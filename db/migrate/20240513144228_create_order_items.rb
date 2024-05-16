class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :item, null: false
      t.references :order, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.string :code, null: false
      t.integer :discount, null: false
      t.boolean :usable, null: false, default: false
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false
      t.string :email
      t.string :address, null: false
      t.string :address_2
      t.string :country, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.string :name_on_card, null: false
      t.integer :credit_card_number, null: false
      t.integer :expiration, null: false
      t.integer :cvv, null: false

      t.timestamps
    end
  end
end

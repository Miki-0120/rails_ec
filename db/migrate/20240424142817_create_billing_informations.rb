class CreateBillingInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_informations do |t|
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

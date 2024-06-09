class Order < ApplicationRecord
    belongs_to :cart
    has_many :order_item, dependent: :destroy
end

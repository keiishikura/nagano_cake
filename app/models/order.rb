class Order < ApplicationRecord

   belongs_to :customer
   has_many :order_details, dependent: :destroy

   enum payment_method: { credit_card: 0, transfer: 1 }
   enum status: {waiting_payment: 0, confirmed_payment: 1,making_item: 2,shipping_preparation: 3,shipped_item: 4}
end

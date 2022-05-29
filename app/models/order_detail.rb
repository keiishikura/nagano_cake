class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: {cannot_making: 0, wait_making: 1,item_making: 2,complete_making: 3}
end

class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id

belongs_to :product
  belongs_to :cart

# method to compute the total price of a single line item.


def total_price
    
  product.price * quantity
  end
end

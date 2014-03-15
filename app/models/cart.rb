class Cart < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :line_items, :dependent => :destroy
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end

# method to compute the total price of the items in the cart. If the total is greater then 60£, %10 discount is applied


  def total_price

   @total=line_items.to_a.sum { |item| item.total_price }
    
    if @total > 60.0
      @total -= @total * 0.10
    end
    else
     @total = @total
   end

 
end

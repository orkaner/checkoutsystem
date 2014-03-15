class StoreController < ApplicationController
   def index
    @products = Product.order(:code)
    @cart = current_cart

  end
end

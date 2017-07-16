class CartsController < ApplicationController
  before_action :initialize_cart

  def show
  end

  def add
    @cart.add_item(params[:id])
    session["cart"] = @cart.serialize
    head :ok
  end

  def remove
    cart = session['cart']
    item = cart['items'].find { |item| item['product_id'] == params[:id] }
    if item
      cart['items'].delete item
    end
    head :ok
  end

  #Delete
  def destroy
    session['cart'] = nil
    head :ok
  end
end

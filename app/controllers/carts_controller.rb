class CartsController < ApplicationController
  before_action :initialize_cart

  def add
    @cart.add_item(params[:id])
    session["cart"] = @cart.serialize
    head :ok
  end

  def reduce
    @cart.reduce_item_qty(params[:id])
    session["cart"] = @cart.serialize

    cart = session['cart']
    item = cart['items'].find { |item| item['product_id'] == params[:id] }
    if item['quantity'] <= 0
      cart['items'].delete item
    end
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

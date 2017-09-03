class CartsController < ApplicationController
  before_action :initialize_cart

  def change_quantity
    if params['quantity'] == '1'
      increase
    elsif params['quantity'] == '-1'
      decrease
    end
    respond_to do |format|
      format.js {}
    end
  end

  def add
    increase
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

  private

  def increase
    @cart.add_item(params[:id])
    session["cart"] = @cart.serialize
  end

  def decrease
    @cart.reduce_item_qty(params[:id])
    session["cart"] = @cart.serialize

    cart = session['cart']
    item = cart['items'].find { |item| item['product_id'] == params[:id] }
    if item['quantity'] <= 0
      cart['items'].delete item
    end
  end
end

class OrdersController < ApplicationController
  before_action :require_login, only: [:index]
  before_action :initialize_cart
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    if @cart.empty?
      return redirect_to store_path
    end
    set_shipping_prices
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart.items.each do |cart_item|
        OrderItem.create(product: cart_item.product, quantity: cart_item.quantity, order: @order)
      end
      redirect_to order_path(@order)
    else
      set_shipping_prices
      render :new
    end
  end

  private

  def set_order
    @order = Order.includes(:order_items).friendly.find_by_friendly_id(params[:id])
  end

  def order_params
    params.require(:order).permit(:name,
                                    :email,
                                    :phone,
                                    :address,
                                    :city,
                                    :country,
                                    :postal_code,
                                    :shipping_option)
  end

  def set_shipping_prices
    products = @cart.items.map { |item| item.product }
    @local_shipping_product = products.max_by(&:local_shipping_price)
    @international_shipping_product = products.max_by(&:international_shipping_price)

    @preorder_dispatch_date = nil
    @preorder = false
    products.each do |product|
      if product.preorder
        @preorder = true
        @preorder_dispatch_date = [@preorder_dispatch_date, product.preorder_dispatch_date].compact.max
      end
    end
  end
end

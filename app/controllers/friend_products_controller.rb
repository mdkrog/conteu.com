class FriendProductsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :set_friend_product, only: [:edit, :update, :destroy]

  def show
    @friend_product = FriendProduct.find(params[:id])

    # only allow signed in users to see non-published friend_products
    if !@friend_product.displayed? && !signed_in?
      redirect_to root_path
    end
  end

  def new
    @friend_product = FriendProduct.new
  end

  def create
    @friend_product = FriendProduct.new(friend_product_params)
    if @friend_product.save
      redirect_to @friend_product, notice: 'Friend Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @friend_product.update(friend_product_params)
      redirect_to @friend_product, notice: 'Friend Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @friend_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Friend Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def sort
    params['friend_product'].each_with_index do |id, index|
      FriendProduct.update(id, { sort_order: index+1 })
    end
    head :ok
  end

  private

  def set_friend_product
    @friend_product = FriendProduct.find(params[:id])
  end

  def friend_product_params
    params.require(:friend_product).permit(:title, :description, :price, :image, :link, :displayed, :sort_order)
  end
end

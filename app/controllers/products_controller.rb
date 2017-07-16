class ProductsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :initialize_cart, only: [:show]

  def show
    @product = Product.find(params[:id])
    # only allow signed in users to see non-published products
    if !@product.displayed? && !signed_in?
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def sort
    params['product'].each_with_index do |id, index|
      Product.update(id, { sort_order: index+1 })
    end
    head :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price,
                                    :image,
                                    :native_store,
                                    :quantity,
                                    :partner_name,
                                    :partner_link,
                                    :featured,
                                    :displayed,
                                    :sort_order)
  end
end
